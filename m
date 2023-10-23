Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E70127D2BEF
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 09:54:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB4B110E163;
	Mon, 23 Oct 2023 07:54:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5262610E163
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 07:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1698047649; x=1698306849;
 bh=U0MZUFxkg3+UOPqNFrbWaEyCbKpVVLhO0H5Klvvg8Vk=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=lL+VJACho1UvWH2TpvqzgGk2GEaCmjd2Cy0LlMg7A0/M9fARj929MAo2vaP+Dns2L
 UszlbpoHPjzn0iHan+IL6h7UGH5F4TREJFPUo7xUZaXQQZZ4RJdpQjPFCUDS3Jh3La
 R5dnRt2NqZGcxI4wYqOUm4U/e3Y1RH46n9DBDsJwtrclJko6uyb22CHp8VJe8BhPcb
 VbtRca/sGejOsaUxY5JbR4QMkuj2dq1XoNQZOdJR48hREt0o1VtyIoZ2XvJFwq1B2I
 uhY4vAHNp0YI10dWDi1eX6PdT2RcHpG7xoFcEn8IktqIO6XZPRirxYVSKk6pbQKb/P
 DSv4qJNVwfWtA==
Date: Mon, 23 Oct 2023 07:53:57 +0000
To: Albert Esteve <aesteve@redhat.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v6 1/9] drm: Disable the cursor plane on atomic contexts
 with virtualized drivers
Message-ID: <JK64byEJdVeFlotnfIzSsyiHWQCs-Luun_S8XqvJ4jG1In3fsBD6FBYZHcmKEvwDOas123VjhJoONJLALDRa5TCdA8avSMEN0xXA6oE8sVU=@emersion.fr>
In-Reply-To: <20231023074613.41327-2-aesteve@redhat.com>
References: <20231023074613.41327-1-aesteve@redhat.com>
 <20231023074613.41327-2-aesteve@redhat.com>
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
Cc: linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 qemu-devel@nongnu.org, banackm@vmware.com,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 mombasawalam@vmware.com, iforbes@vmware.com, Jonathan Corbet <corbet@lwn.net>,
 javierm@redhat.com,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 David Airlie <airlied@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, ppaalanen@gmail.com,
 dri-devel@lists.freedesktop.org, spice-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Matt Roper <matthew.d.roper@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, krastevm@vmware.com,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Simon Ser <contact@emersion.fr>
