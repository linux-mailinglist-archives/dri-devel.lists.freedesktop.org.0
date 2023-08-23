Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AA9785643
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 12:53:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 868BA10E07E;
	Wed, 23 Aug 2023 10:53:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B5210E07D
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 10:53:38 +0000 (UTC)
Date: Wed, 23 Aug 2023 10:53:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1692788015; x=1693047215;
 bh=3utpe3/Si6zt49pneTt7eQMTb1qYXsVOE5jBu1bFUn8=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=J9OAf1uDaf0yKNUa4Ba4jdrLxW9Kjt32G3JCe8oLklxyv+coJ0K4ggMKps111AEpz
 H3C9b0n+EHTaAoNR5upEGlJWkpt2QOu2wTEIt2u9TL4O6tO4gzlJKb7yGr7g3nPI7A
 f6b+JK4SoI/RwoNL74j5Ffq+48rO1tA3H6phn5uQxpUjaSa0H9Daq4IPdbQLvDKCIM
 SC+ZdVdQNd6WXtP5Tb67oYguRfKO/861+6Vr/H3RLNr80v4nVn4dyElj4KajAAQ6ud
 h2cAj6UpBI3Tm0tSryg/s8HjYBpe+k3OjzUb//GOuIdwB7I87h0oHfuynoM7nUm4VB
 fn8LSLZOWtVVg==
To: James Zhu <jamesz@amd.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v6 3/4] drm: Expand max DRM device number to full MINORBITS
Message-ID: <f1Cwh796fW9-Sse4KkXw1Xpgaknx9yWMP3bi-8mGhNOmZ2_aeqg5unzrBNuHiNCPzvXTs6B2tH-XxNH7jVWDzg3PnVmCa5XaXTe3xhxyTM8=@emersion.fr>
In-Reply-To: <61efe587-9a7a-063c-a388-eed9f51958d4@amd.com>
References: <20230724211428.3831636-1-michal.winiarski@intel.com>
 <20230724211428.3831636-4-michal.winiarski@intel.com>
 <83s0YPWEdYE6C2a8pa6UAa3EaWZ2zG-q7IL9M-y6W1ucF9V54VnZtigKj3BGKUA2FZpIrs0VVxmpHO2RAhs_FdOnss9vNLQNSHySY8uH7YA=@emersion.fr>
 <69801f61-37b0-3e46-cbef-31ff80ae9a34@amd.com>
 <TAdBP5BOy3cy7VnUb4t7ZkDOMK6wI_gPCjXanItN3TOsA1TbSk_6yrlcPTqvk3AZjamo96yHlEhjpfNUPFF6tA_9K8iRoie3h_z5Jf6zNtc=@emersion.fr>
 <ad26d275-4373-429f-ecaa-3e35978f1fb0@amd.com>
 <61efe587-9a7a-063c-a388-eed9f51958d4@amd.com>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Matthew Wilcox <willy@infradead.org>,
 =?utf-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Emil Velikov <emil.l.velikov@gmail.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Oded Gabbay <ogabbay@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, James Zhu <James.Zhu@amd.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, August 8th, 2023 at 17:04, James Zhu <jamesz@amd.com> wrote:

> I have a MR for libdrm to support drm nodes type up to 2^MINORBITS
> nodes which can work with these patches,
>=20
> https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/305

FWIW, this MR has been merged, so in theory this kernel patch should
work fine with latest libdrm.
