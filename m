Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YC9JOzJIiWm25gQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 03:36:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C31910B2E6
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 03:36:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 332BE10E0F0;
	Mon,  9 Feb 2026 02:36:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="JRSYMXlz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A1AA10E0F0
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 02:36:29 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-896fb37d1f0so12146626d6.2
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Feb 2026 18:36:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770604588; cv=none;
 d=google.com; s=arc-20240605;
 b=D4201OLIT85l5T0XZomOMQ7rc5NBQAS9aPLItB1+/Z54h00+26g5aGX3soNoP59BQd
 51FZwxlhG1+vjbHSUlWaMEB3jKobDH7uZsQt90kKfWGtiCqaaOp+rRYRLyz/wU7ULzob
 SuowyVdzSvA9yyRPUuqyXz8Ti654nwlqGH/LdNyKTX8RwQnTn5r6LDjno36rcUuTwmRw
 RJl9HlhU579SRtszobkhMDbuu3hsWfrknz+mXAX7P1MnUlVE2NX6qt/yPYPyvqIrj5SP
 GtIc0BoLrTk4LwxyQNBaHT7ch3MgBJo+hFZmewIpp9TayqpC2dvJR/thYv7tDkd3wUP1
 59Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=QwQQ6C9/YdbEnVVFMoKHXxLP3Y/3AZryZFEHNalGX0k=;
 fh=IG3k7Ulhcmu91zF1jkn8SEIr9Ug24LhEMh2/cPTI9EI=;
 b=M3aPahf2CQIr6RvmYWDI6hmEJlPAVpZePqz/cPMZOpBSSl60AzhVw5PPZl39AoDhVp
 15xIkwYHg3E3Q707jyRnsOOnjSnovMxGwqO33H7b3tb4EO8Rby1Q6l2JNoXAXdBnfoeo
 g2607eTKekNRJc6iJCxNF1y+0x/S7xPxlt6docAY5oQj+6iMBZ0XAmHRoFr0getaV6mP
 GK3j39dyb8TMgskM+RgtxQLyj7ujMOJ4L+cVD7M91G5WtagR6DR8wBFuC+eOn0jpdpUn
 for8qPNwVHDBD9pI8bbo9LEFFU0qlefDhmaqmmVkWkkQj+xEAHxDAIHYOqIA1BwRJXQQ
 x8iA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1770604588; x=1771209388;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QwQQ6C9/YdbEnVVFMoKHXxLP3Y/3AZryZFEHNalGX0k=;
 b=JRSYMXlzFTtL1dNVLuwzvm3m1WbP1SSTsz0Ye6+QLnoJfiA/wzRJLdj6F1axcscxji
 ig2XlmdmtxV26AAiLmJmCGZISYK4kgMXfW5U6gG5KzrCMyasdLSeZrKodMrfmfPHOEY2
 ViX4oi1b/GH1IKI5CL62Vgw55QpLKbaK4AWtrJlVZSZGIHoBv3A7JNhUFCuMV7s/2TSu
 r3oLNb/YEudxF4Y82gzp61qHz8YObVowqjO9ruzKku8NE7FU9Um9/LO+l+hAZHMb6CXX
 nrQOKaOk52l7U4dIjhgLiK6ZZCEbTBu39PEa/y+Kqaj5D84MrL7FQgyFyOHHcPpimPmh
 cUdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770604588; x=1771209388;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QwQQ6C9/YdbEnVVFMoKHXxLP3Y/3AZryZFEHNalGX0k=;
 b=EFwFiI9MblvQeOvO2UVbCKHxsn/XfQ7HZ4XXl5iHpHCDz5Jk11caQSZ6zZHMgmhHED
 IS9fuuy+j84OyyMDuCC/lKP0qdK5aoY0QRe0ptLGsWF28IFAvl6C0l15YeLc/Pci0XS8
 wjB3zRu39HJTdbq68iPrMlbaiiq1wS6gogRyk13YE9sUzWP0fSuTS3HZFTQvir6RvOos
 2LWODcMA79Fkb4ftxfDJSg7Mf/xq/AarAs1sXEmM547yBwYL1QrnwBMd7ddojSGOTwGW
 G9OdMJdHfgKLHXzFzzNoid6zAsdGJk2931RBOWkjFuPQYla50QL70SG6Vf8dyJce/1l/
 +tjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIOJCl0mxY1xXZ7tT27Fi0SXe7nHcLlbmCyGOCXTwMC+GQwgJpNRoFufeRqevUYcrm3FKtHXGeBNc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxD5goHZA3p6lTsmKbKlW2dFCc/pRZgQajViRBISlvahCgaDgle
 8nuMgfe8Acog+sr/vIpuGywrXh2YDVybDc0241JS0Z39rf59Oi49PzAOEijcknGfOkhUC2jE9jL
 MPEVnb7Pvm838HY0LUQOa7l7eT5jrNcP6BNtkjEXiVQ==
X-Gm-Gg: AZuq6aJv6eI9LLkAbFoB8U8fn+jPKWKphidm0jv0khZdnVzngfbhIgd0OzCmowanh2B
 vl6vq0wvr3Vsjq7sqWUcOhCDeVTDJMCAtvQUFoqYwdOKIygsBcf6iRZsAe3Opm6e8pupWi+hcAr
 j3s0/fzraP9ly975e02dCtnGeha+Olk7iVrgZzs5DCn7cXHlNDXHtyPemJmHu2LI/TCOi/R92Mm
 a817+vjKF/2X6ySFV2ZQndaDsPtQFx+R2TQNHE8vpSdUr3XXn60x3mLFVcr/v1MMMfFDUbI
X-Received: by 2002:a05:6214:268d:b0:894:6dc8:9255 with SMTP id
 6a1803df08f44-8953cb9745dmr163978416d6.45.1770604588070; Sun, 08 Feb 2026
 18:36:28 -0800 (PST)
MIME-Version: 1.0
References: <20260205154657.3085820-1-yelangyan@huaqin.corp-partner.google.com>
 <20260205154657.3085820-2-yelangyan@huaqin.corp-partner.google.com>
 <20260205-chewing-taste-ad2d71a9ae18@spud>
In-Reply-To: <20260205-chewing-taste-ad2d71a9ae18@spud>
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Date: Mon, 9 Feb 2026 10:36:17 +0800
X-Gm-Features: AZwV_QiMTarjnbg8jt4_obnDVYG-PLn2bp8Tk32qgLF3O2o1CHQYHEIbStEZ3y4
Message-ID: <CA++9cvpxuZG2WQmttkPsx3CjeHQ73AwVF9-uXvztGMpUEQSYbA@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: vendor: add taiguan
To: Conor Dooley <conor@kernel.org>
Cc: neil.armstrong@linaro.org, jesszhan0024@gmail.com, airlied@gmail.com, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 heiko@sntech.de, mani@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, 
 dev@kael-k.io, kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dianders@chromium.org
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:conor@kernel.org,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:heiko@sntech.de,m:mani@kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:dev@kael-k.io,m:kever.yang@rock-chips.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dianders@chromium.org,m:krzk@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[yelangyan@huaqin.corp-partner.google.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yelangyan@huaqin.corp-partner.google.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,sntech.de,bp.renesas.com,kael-k.io,rock-chips.com,lists.freedesktop.org,vger.kernel.org,chromium.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[taiguanck.com:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 5C31910B2E6
X-Rspamd-Action: no action

Hi Conor,

"taiguan" is derived from the company=E2=80=99s English presence and offici=
al website
domain (www.taiguanck.com), which is the registered corporate site for
Shenzhen Top Group Technology Co., Ltd.

Thanks,
Langyan

On Fri, Feb 6, 2026 at 2:38=E2=80=AFAM Conor Dooley <conor@kernel.org> wrot=
e:
>
> On Thu, Feb 05, 2026 at 11:46:55PM +0800, Langyan Ye wrote:
> > Add "taiguan" to the Devicetree Vendor Prefix Registry.
> >
> > Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/D=
ocumentation/devicetree/bindings/vendor-prefixes.yaml
> > index fc7985f3a549..a0fcd7154ff8 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -1598,6 +1598,8 @@ patternProperties:
> >    "^synopsys,.*":
> >      description: Synopsys, Inc. (deprecated, use snps)
> >      deprecated: true
> > +  "^taiguan,.*":
> > +    description: Shenzhen Top Group Technology Co., Ltd.
>
> Can you explain where "taiguan" comes from please in your commit
> message? Perhaps it is the website url for the company?
>
> >    "^taos,.*":
> >      description: Texas Advanced Optoelectronic Solutions Inc.
> >    "^tbs,.*":
> > --
> > 2.34.1
> >
