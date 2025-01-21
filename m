Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD6DA18191
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 16:59:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50D7810E5FA;
	Tue, 21 Jan 2025 15:59:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="l9Ovjg1/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6FA110E5F4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 15:59:26 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-aaf6b1a5f2bso1327575566b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 07:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1737475105; x=1738079905; darn=lists.freedesktop.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XdJdALCpfMsPW8b2vvD3iTsNvqpEAESXqA78u2jp51U=;
 b=l9Ovjg1/Ylf7CX34GBA0D7WgZXsZXjQiVZqpf1hxVgvHEHYIKLGpM9xjzZbGbFAVQl
 jwu5+ZwFDnU+F4n2pUEiGb8fMImRzys7oasjoRcWM7TVWuTGZD/RLvFgsS244BwaLbca
 a4mXU9g5+YJC6aw4y/VY2NPYmKvLCB4EHPlJwdVeetkTQxFu16ss5StwWG9J/aUlBfmy
 18UZevxmCy3ZH3MMRrMktsk1DLXpUqULBxK8ZWZ4c1oymA1RqxF66m2+QgMyd8H+6OHD
 4FGI08D+uy+EdhMdU/9m/hSab7MZinmxy+lWQy0TLx8nOI3dghofLkqJXRngmfo5YTLR
 21mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737475105; x=1738079905;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=XdJdALCpfMsPW8b2vvD3iTsNvqpEAESXqA78u2jp51U=;
 b=NMqkdjnuDPR9rWznMQdJM7JV236H/D+1HI82qZ7qZ0GLfJ0leiaM5NobdUcEJ/Yd2u
 BaYpL8WnUlYqkI2o4JBCQzjL14cNwC6+Fx6AX2AOEwydxO3mnjCOVnvlgx1TEh2EX1r5
 ll7ilrhDi8cwnr/kkZYr0mrMcvKcC/mbLkxwqs/ByOkyD6DO3J2wQnob/q2AIcFU+0l6
 VV/FbLm5/qY9g5C1hWiYm1fxu5Cr1u70qjDnIuzY+YmXW2DUFRHoTayraygOslWjWGwN
 53oGV/jmduo7SLBt8EERCjm5mYyrypLiQ4H5Egb69dJY4g1dww48X7/jvtYLphzsLdXH
 nRbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMkARzZ4fNexmilK01I9+7YWy7uyF7DoRDiWk0Ly+MPkYvGfpGSdM2mEH49RAIPhXuOz9DfBriT14=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+tP0957pHfp/Yef1uenUr55x/U6uHpQTCq/HT87NeT24VtvIC
 EHctYsVbi6x6fMhGCDE/q4q6nXqY/bZyWVEvYLgUeuBCcD8qZXNup9WNTJWO1q8=
X-Gm-Gg: ASbGncuv5Mn2no8UBqqGCvTeCtByz/gFsgzgguFraJM/Ug6LeJS0KX/QzUEIg8IC5Ar
 leqiR/+623ucZzILHGNKmqF6q5hZ3h91AYwEkzDL9cLAjAiLARMOwkFik9EernQM/rmjqxFBDaR
 z6jrs6w03PVOltdsgW/t/GNco/3Yq6pCS5bIh1DOC4wf6PBpjUxqbCiwVTEbKeOMbxtFtFxGCm2
 Y/73tf8UrnF4luoIgxDLJYqAc1aQFHLDvX3dSWifZuOjRaBoerkfZIA4MLNNpyfujw2Dth7NKUf
 yu+7muQ5QOR+QEkSYGAL9ywXmEM/5Dd5yJtCAE4=
X-Google-Smtp-Source: AGHT+IHdkDoF53x8l2SOkiELIyNRQWLeK1YwI2eN4KFrJeV+1D+AZglekd0sHFlT9ypnhGbNQmdg/A==
X-Received: by 2002:a17:907:743:b0:aa6:75f4:20df with SMTP id
 a640c23a62f3a-ab36e241bc1mr1900254266b.9.1737475105126; 
 Tue, 21 Jan 2025 07:58:25 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl.
 [144.178.202.138]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab384fc35b9sm758783466b.161.2025.01.21.07.58.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2025 07:58:24 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Jan 2025 16:58:24 +0100
Message-Id: <D77VIRU2Z0L9.20OBL2OMAIA7I@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>, "Martin Botka"
 <martin.botka@somainline.org>, "Jami Kettunen"
 <jami.kettunen@somainline.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC] drm/msm/dpu: Fall back to a single DSC encoder
 (1:1:1) on small SoCs
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Marijn Suijten" <marijn.suijten@somainline.org>, "Rob Clark"
 <robdclark@gmail.com>, "Abhinav Kumar" <quic_abhinavk@quicinc.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, "Sean Paul" <sean@poorly.run>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250121-dpu-111-topology-v1-1-d01987205c53@somainline.org>
In-Reply-To: <20250121-dpu-111-topology-v1-1-d01987205c53@somainline.org>
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

Hi Marijn,

On Tue Jan 21, 2025 at 12:06 AM CET, Marijn Suijten wrote:
> Some SoCs such as SC7280 (used in the FairPhone 5) have only a single
> DSC "hard slice" encoder.  The current hardcoded use of 2:2:1 topology
> (2 LM and 2 DSC for a single interface) make it impossible to use
> Display Stream Compression panels with mainline, which is exactly what's
> installed on the FairPhone 5.

Nitpick, if you send another revision: s/FairPhone/Fairphone/

>
> By loosening the hardcoded `num_dsc =3D 2` to fall back to `num_dsc =3D
> 1` when the catalog only contains one entry, we can trivially support
> this phone and unblock further panel enablement on mainline.  A few
> more supporting changes in this patch ensure hardcoded constants of 2
> DSC encoders are replaced to count or read back the actual number of
> DSC hardware blocks that are enabled for the given virtual encoder.
> Likewise DSC_MODE_SPLIT_PANEL can no longer be unconditionally enabled.

This unblocks panel enablement on upstream without any hacks on top.
Many thanks!

Tested-by: Luca Weiss <luca.weiss@fairphone.com>

> Cc: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
> Note that this doesn't paint the full picture in case there are SoCs
> with more DSC hardware blocks, but when multiple virtual encoders
> have already allocated most of them.  My initial plan was to code
> ahead for dynamically tracking and reallocating these blocks in RM, if
> some virtual encoder could potentially be using too many DSC encoders
> which, while "power optimal", may not be able to support the number of
> requested displays/interfaces.  Such a solution would automatically
> ensure DSCmerge is *not* used when there are not enough hardware blocks
> available in the first place.
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 47 +++++++++++++++--------=
------
>  1 file changed, 25 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_encoder.c
> index 5172ab4dea995a154cd88d05c3842d7425fc34ce..dcf17b5e8ac8eb76f5ba038fc=
ce48e47f32299d5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -622,9 +622,10 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *d=
rm_enc)
>  		if (dpu_enc->phys_encs[i])
>  			intf_count++;
> =20
> -	/* See dpu_encoder_get_topology, we only support 2:2:1 topology */
>  	if (dpu_enc->dsc)
> -		num_dsc =3D 2;
> +		for (i =3D 0; i < MAX_CHANNELS_PER_ENC; i++)
> +			if (dpu_enc->hw_dsc[i])
> +				num_dsc++;
> =20
>  	return (num_dsc > 0) && (num_dsc > intf_count);
>  }
> @@ -664,7 +665,7 @@ static struct msm_display_topology dpu_encoder_get_to=
pology(
>  	/* Datapath topology selection
>  	 *
>  	 * Dual display
> -	 * 2 LM, 2 INTF ( Split display using 2 interfaces)
> +	 * 2 LM, 2 INTF (split display using 2 interfaces)
>  	 *
>  	 * Single display
>  	 * 1 LM, 1 INTF
> @@ -686,13 +687,19 @@ static struct msm_display_topology dpu_encoder_get_=
topology(
> =20
>  	if (dsc) {
>  		/*
> -		 * In case of Display Stream Compression (DSC), we would use
> -		 * 2 DSC encoders, 2 layer mixers and 1 interface
> -		 * this is power optimal and can drive up to (including) 4k
> -		 * screens
> +		 * Use 2 DSC encoders and 2 layer mixers per single interface
> +		 * when Display Stream Compression (DSC) is enabled,
> +		 * and when enough DSC blocks are available.
> +		 * This is power-optimal and can drive up to (including) 4k
> +		 * screens.
>  		 */
> -		topology.num_dsc =3D 2;
> -		topology.num_lm =3D 2;
> +		if (dpu_kms->catalog->dsc_count >=3D 2) {
> +			topology.num_dsc =3D 2;
> +			topology.num_lm =3D 2;
> +		} else {
> +			topology.num_dsc =3D 1;
> +			topology.num_lm =3D 1;
> +		}
>  		topology.num_intf =3D 1;
>  	}
> =20
> @@ -2020,32 +2027,32 @@ static void dpu_encoder_dsc_pipe_cfg(struct dpu_h=
w_ctl *ctl,
>  static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
>  				 struct drm_dsc_config *dsc)
>  {
> -	/* coding only for 2LM, 2enc, 1 dsc config */
>  	struct dpu_encoder_phys *enc_master =3D dpu_enc->cur_master;
>  	struct dpu_hw_ctl *ctl =3D enc_master->hw_ctl;
>  	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
>  	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
>  	int this_frame_slices;
>  	int intf_ip_w, enc_ip_w;
> -	int dsc_common_mode;
> +	int dsc_common_mode =3D 0;
>  	int pic_width;
>  	u32 initial_lines;
> +	int num_dsc =3D 0;
>  	int i;
> =20
>  	for (i =3D 0; i < MAX_CHANNELS_PER_ENC; i++) {
>  		hw_pp[i] =3D dpu_enc->hw_pp[i];
>  		hw_dsc[i] =3D dpu_enc->hw_dsc[i];
> =20
> -		if (!hw_pp[i] || !hw_dsc[i]) {
> -			DPU_ERROR_ENC(dpu_enc, "invalid params for DSC\n");
> -			return;
> -		}
> +		if (!hw_pp[i] || !hw_dsc[i])
> +			break;
> +		num_dsc++;
>  	}
> =20
>  	dsc_common_mode =3D 0;
>  	pic_width =3D dsc->pic_width;
> =20
> -	dsc_common_mode =3D DSC_MODE_SPLIT_PANEL;
> +	if (num_dsc > 1)
> +		dsc_common_mode |=3D DSC_MODE_SPLIT_PANEL;
>  	if (dpu_encoder_use_dsc_merge(enc_master->parent))
>  		dsc_common_mode |=3D DSC_MODE_MULTIPLEX;
>  	if (enc_master->intf_mode =3D=3D INTF_MODE_VIDEO)
> @@ -2054,14 +2061,10 @@ static void dpu_encoder_prep_dsc(struct dpu_encod=
er_virt *dpu_enc,
>  	this_frame_slices =3D pic_width / dsc->slice_width;
>  	intf_ip_w =3D this_frame_slices * dsc->slice_width;
> =20
> -	/*
> -	 * dsc merge case: when using 2 encoders for the same stream,
> -	 * no. of slices need to be same on both the encoders.
> -	 */
> -	enc_ip_w =3D intf_ip_w / 2;
> +	enc_ip_w =3D intf_ip_w / num_dsc;
>  	initial_lines =3D dpu_encoder_dsc_initial_line_calc(dsc, enc_ip_w);
> =20
> -	for (i =3D 0; i < MAX_CHANNELS_PER_ENC; i++)
> +	for (i =3D 0; i < num_dsc; i++)
>  		dpu_encoder_dsc_pipe_cfg(ctl, hw_dsc[i], hw_pp[i],
>  					 dsc, dsc_common_mode, initial_lines);
>  }
>
> ---
> base-commit: 1573c8d4cb206a2d1454ff711e79f8df2353290b
> change-id: 20240204-dpu-111-topology-b12c1de82c8a
>
> Best regards,

