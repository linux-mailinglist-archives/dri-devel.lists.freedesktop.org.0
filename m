Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44325637EF6
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 19:34:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9392810E057;
	Thu, 24 Nov 2022 18:34:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E7C10E057
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 18:34:29 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id 205so2646834ybf.6
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 10:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zyRhD2tPNIj0nXRz4n59RUuEw/jmNKMtBzavR3aFP6M=;
 b=0mdcxFca7j4Uht3BEQZsAVyxIL/oGWwXqL68PF8S8TY2myiPbTRBVPe3mXvNSKx6av
 KA0SVrScCZM8kb7WL+z+p7kYMu5+ObNL+2oJNIChzua11fp8mgk0JytAYEKvhHTJGih5
 yG7QSlVjc74bVbWPnH1ZFJn+wJViH9pwEF9um1TfMFu/Dg6SxMgKFVqYgJWjo1CW+DEo
 YG316QWq3Nvfn5dO4JO0ITB0sd6Aih4LRNQyVQFypPeEOoiuQMQtUSfS2nA3c9b9s8Ft
 uUKVuMku+HMb7QBkEUSJTqe+gXITuINODm78njcyF8sLq314CNKajBIEaGhHLoLzzC10
 TotQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zyRhD2tPNIj0nXRz4n59RUuEw/jmNKMtBzavR3aFP6M=;
 b=RhtkAGXiL1oqBOgWjuqfATGAHLevl1VgXX1znM31AwkBF4re4ALikFEw6vrxklBEN3
 5w5ldGz8srr6ispLn7ORUSCIIejwiHWSx89Yp+eaagMsSBgGNyMOLDIZG45diwUrKrym
 Xw5CSs/q0WzK8i5Rm5VAthK6sywwbeMJzUKXGSMb7uoBWDqGXS/dmTsasvGHYCBp10/0
 NeY33uvsTrpw5c5e4FjRObWAGNCACdvB1v1Z7T7FA7YB9FFd0OiSUeNVvZk4A4o/jjzK
 qPPwjyLbZTmZn8RlDca3/SG7q9StaTOcGZX/kxPpxEjlc+A5688AZtMtN/l5qheDMX8q
 wi9Q==
X-Gm-Message-State: ANoB5pkQU8TY3DDdgmahHW6hhO+neugP49R5xEaj2Ky2VY3lGpBKIhhK
 P/RlZ0LOHDJCuKMTnEytLAO+O03ha+4YqG4VE0ZcIg==
X-Google-Smtp-Source: AA0mqf6rcnAERmHXaxruYTZAZ0ocrxqnoiTXzYSs2X9Z6f3JMvANi58OnE2gQ2uJU4I1q0FEexhER0auefwS45XVzos=
X-Received: by 2002:a25:6607:0:b0:6df:a8d:d232 with SMTP id
 a7-20020a256607000000b006df0a8dd232mr18901115ybc.142.1669314868648; Thu, 24
 Nov 2022 10:34:28 -0800 (PST)
MIME-Version: 1.0
References: <20221119204435.97113-1-ogabbay@kernel.org>
In-Reply-To: <20221119204435.97113-1-ogabbay@kernel.org>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 24 Nov 2022 18:34:17 +0000
Message-ID: <CAPj87rOc1AZJwSEEsLvx_RLpnUK032t8jHLU1rVgsMisNBYQ6g@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] new subsystem for compute accelerator devices
To: Oded Gabbay <ogabbay@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: dri-devel@lists.freedesktop.org,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Christopher Friedt <chrisfriedt@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Christoph Hellwig <hch@infradead.org>,
 Jagan Teki <jagan@amarulasolutions.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Jiho Chu <jiho.chu@samsung.com>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Oded,

On Sat, 19 Nov 2022 at 20:44, Oded Gabbay <ogabbay@kernel.org> wrote:
> This is the fourth (and hopefully last) version of the patch-set to add the
> new subsystem for compute accelerators. I removed the RFC headline as
> I believe it is now ready for merging.
>
> Compare to v3, this patch-set contains one additional patch that adds
> documentation regarding the accel subsystem. I hope it's good enough for
> this stage. In addition, there were few very minor fixes according to
> comments received on v3.
>
> The patches are in the following repo:
> https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/accel.git/log/?h=accel_v4

Series is:
Acked-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel
