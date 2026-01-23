Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Fs7KRjGc2lZygAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 20:03:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC28D79F20
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 20:03:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7ADF10E137;
	Fri, 23 Jan 2026 19:03:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PwbITEmW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A960E10E2E3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 19:03:48 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-34c718c5481so1455082a91.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 11:03:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769195028; cv=none;
 d=google.com; s=arc-20240605;
 b=h4EPumvWsIwpoxlXV9hcD2zNeJOQaSLeHAY+spYJs/KD9orCKxKtONiSdcTi3Ca4p3
 UKqCM/ET32tviUIwKILF8LnbYbqLNiIQY0ODH2ZMcMALHFFByDyphwwpGMRVw4LUPfMC
 81KPrWJZt1ydJAO9JNKab8ZOE1h5qVlVL5cidLJrqMlFQ7AoH9vnr9HHnzPcFKpjx5DW
 YlLYCaxQ7ew1fem0JX/s1yZ2QTeNkaGJvXJCsYFfGPPoKbJbkF65gCCbgWTlt92Wa5GZ
 pypRoFgmb+T981c/g9NjxZby+wWY5F5zv3iMkn3IaWNJkl4r2sYJKQ44lnBJV/wt5MSA
 CpsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=cNdMOi8yaIIpgWgtclFMzIdtjcYfgL65/4LYK8TeDjM=;
 fh=/9tQaaVX3USEgnyQD98QR7LlWNrNQTOXPIO7NfV3KdQ=;
 b=KLQuLf7AFyaaz7CNVVcPcl8K1oUeIwqdw6so7j5oE6EwoIaQ4ymBTTZdaaS9CqdOJG
 eonA8Mbt9/kysrGfFxZXoI1PaSC78el7R+wci9YG4c4fE+f0n8AJZwadajnbNHyNzrCC
 XCYYC/Lwy0O8AP9ea8LjKk6RSMRgkot6lbdhGorzEiKy2jNcmtv9Ef6UiqU9TMDcYBb6
 KjPChKqJlt45ucBRlr2h22iZJ+jcfbkv/GO4YjfPsJp1IWeyxXAcOXt7IwQw+406EliY
 XDIpE4B6J2n7ZtbxveU+FbSxrZbdNPlZxwlMJcU3sMBZq1G+sYKBO6qCZZtoA5ox2A6N
 yY3A==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769195028; x=1769799828; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cNdMOi8yaIIpgWgtclFMzIdtjcYfgL65/4LYK8TeDjM=;
 b=PwbITEmW7HwS61Xd7rf7r64lotRti9vN5N3Pgjz4yzkeeK/7ssE/Y+ns1ILa9LyD3F
 A/4qR1ml7FLwb5XCTWq1GNHfKOr5jlg1c8XNqZEwcm5QxM+o1kJJlaLPupTdpVDwdX+G
 cMcYnHNkfwHivseoEmuIcntP0Qrq7IJSRxisax/301OthEAUnAKS7xtFC0bczOTjEP+w
 qe2spXYr3bb5P4ylKECHwYsYAH9FqjU16PteHzy/fNJGhnq0LmEA4KjZZZcVVkZfovMD
 d7y1ZZAjv9qWK6hMIhIZkLuSTeZetomzgJzt7Jn1AyWmV1HzYhDO6qJw6ndKuwVdjWKt
 2kmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769195028; x=1769799828;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cNdMOi8yaIIpgWgtclFMzIdtjcYfgL65/4LYK8TeDjM=;
 b=h6BVMqWlXE6K7kUHHhJRVpKwjUT7bi53NuxH6n/hlC8EyK52BWO74h7hPvCnf8COR4
 ECwGVfOYLPoOsScpHrJecTqhJmneA76IRcbpwgfqN2mwMQXNt2k4bBfKafxnK+pyJ25E
 08JOkWCZcCBj/ajvkh8QN5inY1sFJgR9/E8uTvKBPnCPekd2vfK3qmb13qz/AS2QgPuL
 R2CywdwR6VYPZ50xOdjvoMEcAH3b1rACTLwszQuXI4efD8285L7nb0btTOipEG+EQ4Mq
 hawqSoSNlxZOqS+9hVS1EZmmZuZsP+OI9cdTB/HT3c2koLfiqaXpXyJeYbBM00r6wpGZ
 Jw2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqEKKHWNWGae5a6FVivQJWDU54dAIVreUVE8oB7Bh5+xgRTZvypBzMfe4X+Nd6xeznHIwKEfz8arg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDlKVfNdaPsIiRNhcHGXDW7wWYfgjxdT5r0a9K9m/qNrqQNf3l
 mvYYrqcJkQUBLeik7juY1j+o2SRI93Iy9xVAqMhC2b+pfopmlOOIb0TbZLlrYma5Oye8du1ysRr
 JMEu/Sli6H4oylzFUj0jjpFKQInbh37c=
X-Gm-Gg: AZuq6aINT522g9JLb6kQRO+1pOsOb/qvMuM1vD5yN3a4DwzPoh0CWi7rXP1pYM4bAky
 PExyrIFEiIbx49c0wsp+VHSjk2MU3S5tOfDmpZ7TtgSPDdUCG4aiAJSRR/dbDcHnBBzCBZucYgB
 F5Udna3T9gWGwxk2mE0aPhT/fJ9Q/KvklgNoxMH4BAYvjTkpLfd5jFsOhOu4UZwdwXPctMO+1Pc
 sdxWy7OaI4r8tpc5/AlC3HjCTnt7jk68f4KJY6ZA8XqzAF7EnkYSf2d82ghZAC3G00djGrDpSMs
 5ug5/Q3Ys1fF1hqlD5Rki3HONn1DeWA9VZuxu2Dv
X-Received: by 2002:a17:90b:35cf:b0:34c:fe57:278c with SMTP id
 98e67ed59e1d1-3536940db8fmr3166428a91.34.1769195027943; Fri, 23 Jan 2026
 11:03:47 -0800 (PST)
MIME-Version: 1.0
References: <20260124-a6xx_gpu-v1-1-fa0c8b2dcfb1@gmail.com>
 <nsw5leex5uwofbhmue52l4zjmwz2wbel7i5tngjysr73ujvgxh@476xtlglkoom>
 <CAN4SLj3=N0ACXLKbTe1HCjQXuO4GuG+TXEXYjhO-g=u8Y_uKjA@mail.gmail.com>
 <e62971cd-ed56-46a3-ab47-46f3523ceeff@oss.qualcomm.com>
In-Reply-To: <e62971cd-ed56-46a3-ab47-46f3523ceeff@oss.qualcomm.com>
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 24 Jan 2026 03:03:36 +0800
X-Gm-Features: AZwV_QivjQ34-CL7g8z5Ds3bC6eKMP2w7Yc-5ipaWGaKWB4sFP-reRfInpFIWaU
Message-ID: <CAN4SLj2QtbSGG6h+iwEFjNat=5xZxjF9r4GRmfePz=tYGkjGMQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: Fix a reference leak in a6xx_gpu_init()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ustcgu@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: DC28D79F20
X-Rspamd-Action: no action

On Sat, Jan 24, 2026 at 2:23=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On 23/01/2026 20:21, Felix Gu wrote:
> > Hi Dmitry,
> > Thanks for your review.
> > linux/cleanup.h is included in linux/of.h.
> > So it should be included already.
>
> Yes. However we should not depend on include files being provided by
> other kernel-wide includes.
Understood, I will send out V2 to fix it.
>
> Also, please don't top-post when replying to the emails on public MLs.
Sorry for that, thanks for coaching.

Best regards,
Felix Gu

>
> >
> > Best regards,
> > Feix Gu
> >
> > On Sat, Jan 24, 2026 at 1:58=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >>
> >> On Sat, Jan 24, 2026 at 12:37:38AM +0800, Felix Gu wrote:
> >>> In a6xx_gpu_init(), node is obtained via of_parse_phandle().
> >>> While there was a manual of_node_put() at the end of the
> >>> common path, several early error returns would bypass this call,
> >>> resulting in a reference leak.
> >>> Fix this by using the __free(device_node) cleanup handler to
> >>> release the reference when the variable goes out of scope.
> >>>
> >>> Fixes: 5a903a44a984 ("drm/msm/a6xx: Introduce GMU wrapper support")
> >>> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> >>> ---
> >>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 5 ++---
> >>>   1 file changed, 2 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/=
msm/adreno/a6xx_gpu.c
> >>> index 2129d230a92b..0bc518d9fd65 100644
> >>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>> @@ -2640,7 +2640,6 @@ static struct msm_gpu *a6xx_gpu_init(struct drm=
_device *dev)
> >>>        struct msm_drm_private *priv =3D dev->dev_private;
> >>>        struct platform_device *pdev =3D priv->gpu_pdev;
> >>>        struct adreno_platform_config *config =3D pdev->dev.platform_d=
ata;
> >>> -     struct device_node *node;
> >>>        struct a6xx_gpu *a6xx_gpu;
> >>>        struct adreno_gpu *adreno_gpu;
> >>>        struct msm_gpu *gpu;
> >>> @@ -2660,7 +2659,8 @@ static struct msm_gpu *a6xx_gpu_init(struct drm=
_device *dev)
> >>>        adreno_gpu->registers =3D NULL;
> >>>
> >>>        /* Check if there is a GMU phandle and set it up */
> >>> -     node =3D of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
> >>> +     struct device_node *node __free(device_node) =3D
> >>> +             of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
> >>
> >> Missing include for cleanup.h.
> >>
> >>>        /* FIXME: How do we gracefully handle this? */
> >>>        BUG_ON(!node);
> >>>
> >>> @@ -2702,7 +2702,6 @@ static struct msm_gpu *a6xx_gpu_init(struct drm=
_device *dev)
> >>>                ret =3D a6xx_gmu_wrapper_init(a6xx_gpu, node);
> >>>        else
> >>>                ret =3D a6xx_gmu_init(a6xx_gpu, node);
> >>> -     of_node_put(node);
> >>>        if (ret) {
> >>>                a6xx_destroy(&(a6xx_gpu->base.base));
> >>>                return ERR_PTR(ret);
> >>>
> >>> ---
> >>> base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
> >>> change-id: 20260123-a6xx_gpu-cbc095dbe423
> >>>
> >>> Best regards,
> >>> --
> >>> Felix Gu <ustc.gu@gmail.com>
> >>>
> >>
> >> --
> >> With best wishes
> >> Dmitry
>
>
> --
> With best wishes
> Dmitry
