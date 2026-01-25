Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WF24HgVQdmk4PQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 18:16:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2E2818E7
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 18:16:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B6FF10E16B;
	Sun, 25 Jan 2026 17:16:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nKXpQYLB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07C4610E0A4
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 17:16:48 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-352ba1150ddso275702a91.3
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 09:16:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769361408; cv=none;
 d=google.com; s=arc-20240605;
 b=kg467GdB2p+u083Jf3HgClM5SIEA2MxuKIqaTfIkNAuU8V+EnOqeA2nOlotnlIBiUF
 wRC0+LnJCB9L87A0Wj+hmx8ajN3hycoIk7hJodZb8Eb4DckqRgU7i5nQH84/NRFGszMm
 khsL7rJ1EvwVk5jL6BKXReduuQAqErd6KA7n7dIUCNGawfnlrtkzp6hN1Q9FZNwwN2Jc
 Z7HTSPZrzX/02JnryAN1MWrOWdLifr63xwESkgj+PaKOO3l8cvTZzyYaE+MnkCp4PwZU
 vGoJ3HbS8gwzvKtv2qerH7EYwzSJqMwFeASUDDOjWJIlyZCtO7ezYxTm4IDQT1irvczU
 hy8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=k8X9SwxtwKptigAeV0uEMOHmuEgza198fJUXdmHkMTE=;
 fh=wabOocMIopfkqFH3JeU1xqkMvXD/VBlXb3pddsBmBWU=;
 b=YIonJW3ol2nRzYFjD7PgstaPQ00z63Fa3qmdtJsdZog4/iT7Q12FelE/+5Zph/pK74
 Mnb1TopaUcpf6VczAmIE4+UKX9Zt6VehqlB9r9qT6nXAsF3tP3Wbp8X6Jlo1bGFL5TQH
 Ew1dH0N1wP5dJhgMicyMYPIudFZj9ySbAWndm+cdsv9lU2hTqIXf083/JrLmRTqIcrRF
 9SRy3L16BWmw3Cvqb5pc82EjO5Mr3Tx7ilHj4jGNTLSS8xXnSq2Kn7CKOUw4Xfw1FFfw
 mR2xjELTS1jmWbfFGtcPWBXVGD7/h9NQt7lrPh1Gvs2miMQAtlLwakKs77OKcgjSGitE
 iV2A==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769361408; x=1769966208; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k8X9SwxtwKptigAeV0uEMOHmuEgza198fJUXdmHkMTE=;
 b=nKXpQYLB7Ni1b67bnsVCqbij/AzLhr0ff1nhtHvnU9CWsVStKf0TgStoW5vZ9NSU3w
 lT1eDnqp5joPie2Brb+EtahHHFVOX03xyKwomVZCao9OgWbJoHh+BlvBSffhBQex3mKg
 OfVrR9TGvb2ehJxQ/PYjXSrF1TdUAcDwC50CjQ1FubEPWLcg40p0OE6Ro8lkYPjaBz8Q
 ghsNINJ4eubD4cy6XApflxLSjFkIpf7rl3XcVnUUkDDLZotlHkqfVCsF9TUeM2AFDyhT
 RIM1Lrv2WZXmZ6/7Zx13YRrfkxCEAljs4Wioi1pHu2CqM1vJLfGqifkoEMSVfQspiX70
 QqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769361408; x=1769966208;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=k8X9SwxtwKptigAeV0uEMOHmuEgza198fJUXdmHkMTE=;
 b=IdqupQMfnOMsAYY5LgN+zfB+gY2CVH+ItdNUkH9k7Lgmbs+QTnyi1Kf7Tvjxy3K2Kc
 h/zHxsDCjllGQliQx4hxD5phFy5cHeGeBcmAwWyRseYoLBh+I18raphRxtxiyEeB3nv4
 eIsYC4DdrWoBhw2V//RLDblJrKjCaRM/pyIrLfvexayA9VNt+/L4ICU3FpErNlnRSz1w
 GBGu33icxd5REEOUunfUqZiOkUnjh+r975IMKUMENU+/pMuVqlUsEQbU+9SJ5aDZpwRc
 /hv5tRolkhWvTAB27f5PDsYmwYiyca++3VpPgXsBJw7QDAmRARVba5g7wYoJ0on3Q1wD
 RZjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7vlO9f+LZ6ADdVOBiWE0RW2xDi5JgkXwxBS69cO8jw4ojwNKUKo0sxpEi83JOIqS9CP6/7N1X9Xs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzrFUlmFf5JhLrxP6cBV9IzcewhkQbglGCtL0zth/S9mnzBdkuN
 CbnEbTQ/+Y2GUKHH7oG0r4wC/k7GUVGRIAUcfgLyUotS74lJTGjTsHdj0ia/fHGyjOBaCs5vjk1
 iyi3AS0QyxBSTA2AzJ6jHc4tGdTm8sNA=
X-Gm-Gg: AZuq6aJM+NZSNLQuaPC6pDJX08rtb0YFB2urPOvQGhXzRDkEFPSVMyQwyBjK4XKzOoh
 nm+LG36rAYQKRQJDdXob/qXhayJzHb5e5bxen5ZFZ8dWMu/HcF0cqJ/AHXEf1OUsSjCAjsZ8Tkr
 yDrIF2V+LGlnVRVEMMYZ6tJRQgRGTirgRCwp7JJ3KO8nlgCqG7rCEL9caXETaXoJM2vPFkq3r8j
 lETMTgJUsBl3a5Ar4cBVhgHsQm075CV5DRjM/kzMzUc91jaIA3zSWcLtqWtNov67nPcIg0=
X-Received: by 2002:a17:90b:394a:b0:340:dd41:df7d with SMTP id
 98e67ed59e1d1-353c41625dbmr1417254a91.3.1769361408319; Sun, 25 Jan 2026
 09:16:48 -0800 (PST)
MIME-Version: 1.0
References: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
 <20260125-iris-ubwc-v4-2-1ff30644ac81@oss.qualcomm.com>
In-Reply-To: <20260125-iris-ubwc-v4-2-1ff30644ac81@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Sun, 25 Jan 2026 12:16:37 -0500
X-Gm-Features: AZwV_Qh6bCEQHtHjA5NyO7y-zT5kVNEbiRdlIWpRsBNsjtNaSF0FG6h2tF4V0UQ
Message-ID: <CACu1E7Gpzgg0WKT9EyFO+uJsGCVAcEUG1OkTdhXLpGThTrd=Ww@mail.gmail.com>
Subject: Re: [PATCH v4 2/9] soc: qcom: ubwc: add helpers to get programmable
 values
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 "Bryan O'Donoghue" <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-media@vger.kernel.org, Wangao Wang <wangao.wang@oss.qualcomm.com>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:akhilpo@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:wangao.wang@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[cwabbott0@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cwabbott0@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 2B2E2818E7
X-Rspamd-Action: no action

On Sun, Jan 25, 2026 at 6:37=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> Currently the database stores macrotile_mode in the data. However it
> can be derived from the rest of the data: it should be used for UBWC
> encoding >=3D 3.0 except for several corner cases (SM8150 and SC8180X).

FWIW, there is a UBWC version 3.1 not currently reflected in the code
which adds the 8-channel macrotile mode. If we just added that and
made SM8150 and SC8180X be 3.1 then we could derive it from the
version.

Connor

>
> The ubwc_bank_spread field seems to be based on the impreside data we
> had for the MDSS and DPU programming. In some cases UBWC engine inside
> the display controller doesn't need to program it, although bank spread
> is to be enabled.
>
> Bank swizzle is also currently stored as is, but it is almost standard
> (banks 1-3 for UBWC 1.0 and 2-3 for other versions), the only exception
> being Lemans (it uses only bank 3).
>
> Add helpers returning values from the config for now. They will be
> rewritten later, in a separate series, but having the helper now
> simplifies refacroring the code later.
>
> Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  include/linux/soc/qcom/ubwc.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.=
h
> index 5bdeca18d54d..f5d0e2341261 100644
> --- a/include/linux/soc/qcom/ubwc.h
> +++ b/include/linux/soc/qcom/ubwc.h
> @@ -84,4 +84,19 @@ static inline bool qcom_ubwc_min_acc_length_64b(const =
struct qcom_ubwc_cfg_data
>                  cfg->ubwc_dec_version =3D=3D UBWC_3_0);
>  }
>
> +static inline bool qcom_ubwc_macrotile_mode(const struct qcom_ubwc_cfg_d=
ata *cfg)
> +{
> +       return cfg->macrotile_mode;
> +}
> +
> +static inline bool qcom_ubwc_bank_spread(const struct qcom_ubwc_cfg_data=
 *cfg)
> +{
> +       return cfg->ubwc_bank_spread;
> +}
> +
> +static inline u32 qcom_ubwc_swizzle(const struct qcom_ubwc_cfg_data *cfg=
)
> +{
> +       return cfg->ubwc_swizzle;
> +}
> +
>  #endif /* __QCOM_UBWC_H__ */
>
> --
> 2.47.3
>
