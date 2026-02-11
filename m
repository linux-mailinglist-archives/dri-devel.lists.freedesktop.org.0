Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LK8J8g4jGlZjgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 09:07:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 045851220B0
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 09:07:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77C2210E225;
	Wed, 11 Feb 2026 08:07:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JOqoloCU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA1AC10E06F
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 07:33:20 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-b8837152db5so895427766b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 23:33:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770795199; cv=none;
 d=google.com; s=arc-20240605;
 b=P9n9UrzBuZ2LTuHclV0LAFz6Bd0Dwazo/OM62unzG2HzqEhoaUaAyKoIHvMH+MF4Or
 WptU0lgGNx99uqr6HVqNXYCu9NKr3ZHN9Hsck6Bf5gJZxbzPRR3YTahhknCAsBPIujVn
 eBumM2N1Inv58l66LTx5VaDlQqnfHhdH357ezJAIk3ou7raL6ek3izsEmgcPN3qTTCfc
 qYmPw3rWwHAuavr8X8DMOFWGjHtXn5uOnmh2bONqP8ekHHw/6IIpaHy6Xf9GqqpG3Cz4
 ti2udXPnK7JlYE2Jfuhkps2Uozuqjx7h70954XHdfIOOmBNaYSq/6s1IEMmS8dLlG+2F
 s9Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ThNzNNvzlVNC2BsqbFUMfrNhB3xMxVm8Q3gZIOSL6nw=;
 fh=D8BFac79SQoB3lgVLOHc7trxopGRvYWnyeJNjjBAtYg=;
 b=gZ0JHpAdeFkle5Ewc/HHegX0GLyGfIPXROJ9Z7J9IocCWBk/1BI2Ek2KH9QZuvyH6k
 R3OvFWYqWhG8V8L4jYIzJhm57b/FD3ZjdE+TYuIn7OFQsEw1BK94roXeOsmHKod+NsUI
 /8tmBACFRjya39cdegTZuDB0UqjsZdsjiHhyEXW8JT6lR+c6Xfdcq/8yyR15uoqFkhoY
 wGMgcZpAnQIhlK+sPx9l8OnhUpEDycwvmD7eXu7k2Vb+ANa7G/e7KYjy8WBQ2ayKsE3y
 KmAlPK+mKkcY42jgaC4FgHcylPQWSz2GKYwQnISdw/eZ+O+HdI9v7NNE/cQ1GVKNXWpN
 JiuA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770795199; x=1771399999; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ThNzNNvzlVNC2BsqbFUMfrNhB3xMxVm8Q3gZIOSL6nw=;
 b=JOqoloCU5See2/QrWWRSbYrHWHEshdkwFKVEoX0SzRuLb6NTW6ThERIpBDF+Jz8Unl
 jmcuZzBIPwmcY5oSN238yJUZFp0OgYyx48p7ICXyGM7e6G4RRUV1QDdZwthKq2lYJEyL
 cTjBR2qFROks2/hbPN45dL/z882BvuTCvVPj8PL8ka/Cj1xtiqMTKHB1TheI46VlCZFz
 +LpQxeVWUa4iw2XiQuQjo11fYZOjzeu17J4C+b0v3cmU9MdzswHdA2o2OYqMM0dHdkRj
 dvmKBCyK4MHVE2J9V7CyssE9t7aPeHYIDJ3+Z4yFy1lVHVMsWXrjNMFMN+ZizahXtGOA
 ifWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770795199; x=1771399999;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ThNzNNvzlVNC2BsqbFUMfrNhB3xMxVm8Q3gZIOSL6nw=;
 b=p/5enhgQwZl+8PI+FkgVCtnBRO5UKKawSAAWBABsOwi6KDv/o8cZ7ofF0yiEHNwanA
 RoY/gael+l5afEZgMIdh4dHn6ZHlouiWRT2cBrdvyGsyFPGjGcaRY6QZ2QJftpRLDThE
 2ESgWS/Mihq54+CS/NNdJIaAdIXeXtmVOqP30Ta2JtfnMmg4giY0YnSv25pYyl45yr5C
 kN6Xax46trmmwegLhqD5RFI2w11hCw+qDORLcCvs+QeC3sSyV+/JprgEcWxilD2FORSD
 m5vUjnUWnB3o5dqonKsXNRHe1YPI1G1Fv9XMwAmFzwzofjLHMPVtl52Zsd0vuH8EeE4W
 QrEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOTs4IO5RwnXdTUKsVu2FKf1+q/yLQWX2Wplvl1+YyxjllnXko6+yYtVshlvM6+Xuq5MEWh8RJC3c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzA6yOe2a6Ee9jjf7FvbFyslNF1+BkqmsYutYvHyAYdBHxAtUWZ
 iuD7LMwd2w6kOi215a0vhJ+hVOLg7GHEUIxDNFWM/YFqHFvMA+WDM2gasVdhA9J5KJpwehyWGUv
 zVkfY/KvdT/VDqOlNbr9/5ujdhLEZvHQ=
X-Gm-Gg: AZuq6aKvuUc9mbwg/qqcEn1bCVjaUDpkda/kDTXYNQixVQ4qUT5tLFzJ/aR1DNKu4DV
 RaDY6SWrvLeKjoXkN+o/gEnSzRsJFM714eGZeYdzFgTpWZD14GDTJIXvv1OTHS8B07SsTe005fy
 ydHunb8geT5ramd8eZ69C3vGTVtPF7nMi6bWhkB4G7VieqRbyoOz9lk1vSHIoBo/DqcwT/K2PNI
 AD7ksG+32Wlif6sN47msLA0squwjMbA/k1aQTU+qBle1jtrtIZ/AIG2WsE5Y6PG0Qf8Fvwpn3mk
 17/ec6SfPxuCGyQ=
X-Received: by 2002:a17:907:6094:b0:b8d:f859:d228 with SMTP id
 a640c23a62f3a-b8f5440515fmr282806366b.17.1770795198893; Tue, 10 Feb 2026
 23:33:18 -0800 (PST)
MIME-Version: 1.0
References: <20260210183812.261142-1-work@onurozkan.dev>
In-Reply-To: <20260210183812.261142-1-work@onurozkan.dev>
From: =?UTF-8?B?5a2Z56eR?= <sk.alvin.x@gmail.com>
Date: Wed, 11 Feb 2026 15:33:07 +0800
X-Gm-Features: AZwV_Qj7Gk4cKKlrujf3XeOqCG31_GPZOZQjbDGsb0-tcqm1_zyBNGep2ZlP6F4
Message-ID: <CALpAb9MZN_Tj1n5Ju6cXVzYK=MSuf4gNyt6sNZGHB8GEGrzUTQ@mail.gmail.com>
Subject: Re: [PATCH v1] drm/tyr: gpu: fix GpuInfo::log model/version decoding
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: daniel.almeida@collabora.com, aliceryhl@google.com, dakr@kernel.org, 
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 11 Feb 2026 08:07:28 +0000
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:work@onurozkan.dev,m:daniel.almeida@collabora.com,m:aliceryhl@google.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[skalvinx@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[collabora.com,google.com,kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[skalvinx@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[onurozkan.dev:email,model.name:url,mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nanopi-r6s:email]
X-Rspamd-Queue-Id: 045851220B0
X-Rspamd-Action: no action

Verified on my NanoPi R6C; the GPU model is now correctly detected and
printed as follows:

root@nanopi-r6s:~# dmesg | grep tyr
[    1.894322] tyr fb000000.gpu: supply sram not found, using dummy regulat=
or
[    1.894527] tyr fb000000.gpu: mali-g610 id 0xa867 major 0x0 minor
0x0 status 0x5
[    1.894534] tyr fb000000.gpu: Features: L2:0x7120306 Tiler:0x809
Mem:0x301 MMU:0x2830 AS:0xff
[    1.894539] tyr fb000000.gpu: shader_present=3D0x0000000000050005
l2_present=3D0x0000000000000001 tiler_present=3D0x0000000000000001
[    1.895170] tyr fb000000.gpu: Tyr initialized correctly.

Tested-by: Alvin Sun <sk.alvin.x@gmail.com>

Best regards,
Alvin

On Wed, Feb 11, 2026 at 2:45=E2=80=AFAM Onur =C3=96zkan <work@onurozkan.dev=
> wrote:
>
> GpuInfo::log() was decoding GPU_ID like this:
>
>   major =3D (self.gpu_id >> 16) & 0xff;
>   minor =3D (self.gpu_id >> 8) & 0xff;
>   status =3D self.gpu_id & 0xff;
>
> That does not match the Mali GPU_ID layout and mixes unrelated
> fields. Due to that, model detection becomes `mali-unknown` on
> rk3588s which is wrong.
>
> We can already get all the version information with a single
> GpuId::from call (less code and cleaner), so this patch uses it.
>
> Also renamed `GpuModels` fields from `major/minor` to
> `arch_major/prod_major` to reflect their real meaning.
>
> This change was tested on Orange Pi 5 (rk3588s) board and the
> results are as follows:
>
> Before this change:
>
> $ dmesg | grep 'tyr'
> [   19.698338] tyr fb000000.gpu: mali-unknown id 0xa867 major 0x67 minor =
0x0 status 0x5
> [   19.699050] tyr fb000000.gpu: Features: L2:0x7120306 Tiler:0x809 Mem:0=
x301 MMU:0x2830 AS:0xff
> [   19.699817] tyr fb000000.gpu: shader_present=3D0x0000000000050005 l2_p=
resent=3D0x0000000000000001 tiler_present=3D0x0000000000000001
> [   19.702493] tyr fb000000.gpu: Tyr initialized correctly.
>
> After this change:
>
> $ dmesg | grep 'tyr'
> [   19.591692] tyr fb000000.gpu: mali-g610 id 0xa867 major 0x0 minor 0x0 =
status 0x5
> [   19.592374] tyr fb000000.gpu: Features: L2:0x7120306 Tiler:0x809 Mem:0=
x301 MMU:0x2830 AS:0xff
> [   19.593141] tyr fb000000.gpu: shader_present=3D0x0000000000050005 l2_p=
resent=3D0x0000000000000001 tiler_present=3D0x0000000000000001
> [   19.595831] tyr fb000000.gpu: Tyr initialized correctly.
>
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---
>  drivers/gpu/drm/tyr/gpu.rs | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
> index 6c582910dd5d..da97844efbec 100644
> --- a/drivers/gpu/drm/tyr/gpu.rs
> +++ b/drivers/gpu/drm/tyr/gpu.rs
> @@ -99,13 +99,11 @@ pub(crate) fn new(dev: &Device<Bound>, iomem: &Devres=
<IoMem>) -> Result<Self> {
>      }
>
>      pub(crate) fn log(&self, pdev: &platform::Device) {
> -        let major =3D (self.gpu_id >> 16) & 0xff;
> -        let minor =3D (self.gpu_id >> 8) & 0xff;
> -        let status =3D self.gpu_id & 0xff;
> +        let gpu_id =3D GpuId::from(self.gpu_id);
>
>          let model_name =3D if let Some(model) =3D GPU_MODELS
>              .iter()
> -            .find(|&f| f.major =3D=3D major && f.minor =3D=3D minor)
> +            .find(|&f| f.arch_major =3D=3D gpu_id.arch_major && f.prod_m=
ajor =3D=3D gpu_id.prod_major)
>          {
>              model.name
>          } else {
> @@ -117,9 +115,9 @@ pub(crate) fn log(&self, pdev: &platform::Device) {
>              "mali-{} id 0x{:x} major 0x{:x} minor 0x{:x} status 0x{:x}",
>              model_name,
>              self.gpu_id >> 16,
> -            major,
> -            minor,
> -            status
> +            gpu_id.ver_major,
> +            gpu_id.ver_minor,
> +            gpu_id.ver_status
>          );
>
>          dev_info!(
> @@ -167,14 +165,14 @@ unsafe impl AsBytes for GpuInfo {}
>
>  struct GpuModels {
>      name: &'static str,
> -    major: u32,
> -    minor: u32,
> +    arch_major: u32,
> +    prod_major: u32,
>  }
>
>  const GPU_MODELS: [GpuModels; 1] =3D [GpuModels {
>      name: "g610",
> -    major: 10,
> -    minor: 7,
> +    arch_major: 10,
> +    prod_major: 7,
>  }];
>
>  #[allow(dead_code)]
> --
> 2.51.2
>
>
