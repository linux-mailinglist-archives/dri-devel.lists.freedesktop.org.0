Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLbaNcV3mGlrJAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 16:03:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DDF1689D4
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 16:03:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 961B610E7FF;
	Fri, 20 Feb 2026 15:03:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JGIGWlbi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A221610E7FF
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 15:03:30 +0000 (UTC)
Received: by mail-ua1-f54.google.com with SMTP id
 a1e0cc1a2514c-948b5faf377so83376241.1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 07:03:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771599810; cv=none;
 d=google.com; s=arc-20240605;
 b=c8zyQqSL2C8Js8WUArtBVEyUHFCgsmxlruGuAvU1dfQptdCIkrqPGTO9EYwGB/zVN5
 2yDTYf9Usqg1bSZeSpRod6sRnonZpLhZlKWb+MGL9+vp0w9rSkGtTGXLtqfyLWZ0g529
 8TO9n56bSGAq1CQBA5fXf4Z7zYJtuhtDN0f4yFCef1kUMfgrMF8D7Uk9bzjNYxqyAaHv
 yydHzSaVfRiQIDLQane6Q6pS1TRP/8OUpXQcqu7eWPt1cU/WJp87IXYPnz29DkG1H97a
 2CcXY8DsfJJgwGDMjlV6GgA6bXvDB8gyoLiRXoil5G2NsA3lIk08og0hSjigugZVGF4w
 WqiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Odg/Bm82TvOBrG+gqcQac8dhCg7ncUD3MQyHzmQJP2w=;
 fh=9BRX9ZDY115nQeNkjSa3xAo/kHfuYXmgiYKE9aLbjfI=;
 b=BOEUBQH0Yx4LZty0ZzASLXfC6Qn7CgCpoYQaPz0+WFg5i7fFeiQVDKFkjltSX+jX1P
 0RgjW5QjK6S3COum45yJuErOE2+g7zNwD7OULBmNb79oWoiFcHnMfv9vdfwiIIrsTm/9
 D/0yPNf29MkDAGXpL2KegL6uYgom3q/8WzkzIw3zI3WzJTaT7bveKDNI74qityJVBDbw
 exGlU0CynvBOe1t2t8WuXfapYcrfyXYXdja2+LbN/rjLkTQM8Z5xYPdlr0PShSUN9saT
 No1JiV62TYe+ukERnm/nXC9KGR++B3QwLbc21yfafsZwqzTkfRtFIcfyl0msyOzRRhFf
 SAww==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771599810; x=1772204610; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Odg/Bm82TvOBrG+gqcQac8dhCg7ncUD3MQyHzmQJP2w=;
 b=JGIGWlbigYVCp/pSVjiY8N5DUHBVrn7QBHYXlOZoriitKGwLxBFrwBmG0WCB1kqXRn
 EG/V7txy+9DcIeq6uU5LwhphYTSI/womf91lwSw+erPJ3aPsG2/h9+UNfr4DVKV+HFZ9
 z+LajxUCut3yhnoRAu346QNp9TeFLkt1INsbkgoWnqb/fPvjf4Ovsfm0uxUk9LQV3DFz
 l2RzIrIo2aIBRsT5SnB6nbV2NPUlKAwsnhGKv5Egz+Z+tmtIGdaouQKLkbQf9NvBM8Zo
 JDnJNhG5219mZN7ILJwxjKMFkkWZR51EZvowCBUF2RPu6GAZoJSAsJN4dqTHEqdpfciK
 EPRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771599810; x=1772204610;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Odg/Bm82TvOBrG+gqcQac8dhCg7ncUD3MQyHzmQJP2w=;
 b=mOgjoGCCMBCn91TWhcrB+LqJRiA9QrJxamlE5YwowW+A4sEcP2myiughQHgazDSPZB
 lUdH8LZqSsiQzLZAH88Qj6N7Msl+qz1F1EF5k0+gdoQQIJ3pvlqFhddcO7HcWnVDje7U
 oA1CMq/5A8aL5pi21GnBpo1OP8oTJbmxRaK8HwxR5FakqUSg/svUgwJWjfZMddJvPJai
 LTiO37orxDFQhyEFtKgtrhSXI0+VUX3/h3ka85Y5Ckmjn1ltpx3eagmkYH38c4aXLOCI
 U4+1+HzhVcA+Gop1LsO4VyqCYAfAv2hI0nuh2lFQmWytkvoswREGJMXYb8pSr06lRdbK
 wFTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoeTh1qdlDlN7qKCSxxJoGtcTwhmCXLqlPDK+Bvvbtg/5QCef/TV55GUIcZ67i2cBPJ2/ZIRBgMUw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8EutBEauczyZ2nsedvhgdQc/WnBn46Cn0b6lKGDTQs8LJ2W8R
 nCNqpzY2+u4spAicoRagEeGW/WCMsYxHh9lSPMHCR0tWZuQ2gbc2m3oni/p+fxCUM3TBDCW7QWo
 5Y1Wmck1hLJDsM5QRzR3nZDg29jCF+yXUciYHB9snAw==
X-Gm-Gg: AZuq6aKXhT4nJ3qgOyk5oXOvL2c0Jyb2j/aXprkYKieo8ARPNqjSKcoOn/aknfSRuDL
 T6cuyNsyK7pi5HTG3jpgmIZYtN0fkb2v+RqXU7zArULF7AMItnxutq/kek8/+qQusbrFufETRaN
 xhD5kMy72s9KUcvq0f9fbmXoXyVyXgmaCgJvyu5sEuqohugPqtssKkFYORoQ6DCoedOQd9RKV1b
 2Tb9g5bQkS5ZFynGZ6mS5HJCXZFO8uOiGTfHFue6w0h26t5IFLd0ehQ8gT89IzNlDS13MoVek+H
 wdP58cKs8vmbNMX+
X-Received: by 2002:ac5:c7b4:0:b0:568:8fbe:a0e1 with SMTP id
 71dfb90a1353d-5688fbead67mr3316529e0c.1.1771599809389; Fri, 20 Feb 2026
 07:03:29 -0800 (PST)
MIME-Version: 1.0
References: <20260218-ethos-fixes-v1-0-be3fa3ea9a30@kernel.org>
 <20260218-ethos-fixes-v1-3-be3fa3ea9a30@kernel.org>
In-Reply-To: <20260218-ethos-fixes-v1-3-be3fa3ea9a30@kernel.org>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Fri, 20 Feb 2026 16:03:17 +0100
X-Gm-Features: AaiRm503LMZuKmUZCmPaIFqOMB4DTBLKNsXTQv1BSlK7kwkNgXFqppgxvOrsFCo
Message-ID: <CADYN=9KcLBmchj5hZnQoOD7P3L+ek+F2OR3bnN4edkYUMAtByA@mail.gmail.com>
Subject: Re: [PATCH 3/3] accel: ethosu: Handle possible underflow in IFM size
 calculations
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Frank Li <Frank.Li@nxp.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[anders.roxell@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:tomeu@tomeuvizoso.net,m:ogabbay@kernel.org,m:tzimmermann@suse.de,m:Frank.Li@nxp.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anders.roxell@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 43DDF1689D4
X-Rspamd-Action: no action

On Wed, 18 Feb 2026 at 23:22, Rob Herring (Arm) <robh@kernel.org> wrote:
>
> If the command stream has larger padding sizes than the IFM and OFM
> diminsions, then the calculations will underflow to a negative value.

Nit is "diminsions" -> "dimensions"

> The result is a very large region bounds which is caught on submit, but
> it's better to catch it earlier.
>
> Current mesa ethosu driver has a signedness bug which resulted in
> padding of 127 (the max) and triggers this issue.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-and-Tested-by: Anders Roxell <anders.roxell@linaro.org>

> ---
>  drivers/accel/ethosu/ethosu_gem.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
> index a735f860a119..d1169001c83d 100644
> --- a/drivers/accel/ethosu/ethosu_gem.c
> +++ b/drivers/accel/ethosu/ethosu_gem.c
> @@ -245,11 +245,14 @@ static int calc_sizes(struct drm_device *ddev,
>                         ((st->ifm.stride_kernel >> 1) & 0x1) + 1;
>                 u32 stride_x = ((st->ifm.stride_kernel >> 5) & 0x2) +
>                         (st->ifm.stride_kernel & 0x1) + 1;
> -               u32 ifm_height = st->ofm.height[2] * stride_y +
> +               s32 ifm_height = st->ofm.height[2] * stride_y +
>                         st->ifm.height[2] - (st->ifm.pad_top + st->ifm.pad_bottom);
> -               u32 ifm_width  = st->ofm.width * stride_x +
> +               s32 ifm_width = st->ofm.width * stride_x +
>                         st->ifm.width - (st->ifm.pad_left + st->ifm.pad_right);
>
> +               if (ifm_height < 0 || ifm_width < 0)
> +                       return -EINVAL;
> +
>                 len = feat_matrix_length(info, &st->ifm, ifm_width,
>                                          ifm_height, st->ifm.depth);
>                 dev_dbg(ddev->dev, "op %d: IFM:%d:0x%llx-0x%llx\n",
>
> --
> 2.51.0
>
