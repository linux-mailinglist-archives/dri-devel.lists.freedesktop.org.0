Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOpHF4qQjWl54QAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 09:34:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F5E12B5D6
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 09:34:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2899D10E6F6;
	Thu, 12 Feb 2026 08:34:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BV/xXJQM";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J4w19vSS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A490810E6F6
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 08:34:13 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61C3S3gd3145471
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 08:34:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 k0/wFe+2io5iVKVbQo0EV0I44bf5kR97kXAKzX4kik8=; b=BV/xXJQMia350Zop
 N4KbczFkHrZqjrU1MkiqgYZrPf3SgaSr4/nUVAJb1coMF45VUuF2yq3Jp6pK8Dew
 yP75CcR7pdYi0kD4SzaOdUPeMKMC5jxkDnCHjd/hf6IG8wesftQO057+WsBnlOs/
 YCQ2FpzliKZ6GInPXfL771YVrxXjpykkB5y34SCaCcV5T4Tr1AXojQ0Hc2nPSQ4E
 HQ7WoucYdXr7+yQ9pTTjjSJ7uRC7tnm39jDpb0OI01o3qlFF6+zuyqt/s+LkyiEt
 DPKkX+2ilhhv2wDCYF9bIJ7sRlJ2u8+boZSaQVdYqiyct1d2EohpNsbqHa7ghebz
 fVe39A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8ukt32uf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 08:34:13 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-8946f51b8c8so262686716d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 00:34:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770885252; cv=none;
 d=google.com; s=arc-20240605;
 b=ejNd1aJKO7UUbz1fyuqOPQGQGfHUxL33Eaq4eJexgqeiEGDk/OOU87THb9XEmF3u5m
 hGIAtqdlpBVen8ANP3r+ub5nGs4oF0loKJbK4tPEOxe20Adrtx487XQh17NaSTfmDcRz
 /ZDFzptAPnwxAXVj9T08uZHFcHpG+aUut79B2AgN/+fGQdQP8PihHz67QMOqswnDG5lA
 hJZxj/sOVLfRpE6iB+Bd3fSLVOB42ns7nS+qZAIDYn0PAaVqklCuPkE5LnH6FOXilXjh
 MW053kCcAZqcbhKx6mbLEE56E0xEjP5A+xC/0/VjzFjF94b2L3tTNbnEnGld7L4yPkv0
 w0RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=k0/wFe+2io5iVKVbQo0EV0I44bf5kR97kXAKzX4kik8=;
 fh=Z++Rq5OLsQifjcSH28sEiTa2nmwAUZaAc+qJ8/i7sg8=;
 b=U8hfNxR3ttL9sles6MzbNIWLhpmEG0jBsFdY7QCE7OP5xMLWS0yBev8jQJrFcVSXGB
 dJjDebczzY2+qZoin3Ephx9jbMUpqbvmuEtAvCxUITssKUQ0pw7wSL67NiADdfbrLEfr
 QEbvQoIcga53dye4xgwQSjnj7wJJ8Ooj41q7Fd96NMUDNRMOsxE2hV39C9WAr/rdcrRN
 wRbhycyW4M7BgiD/Azuy+AWUWDFK9kPwNH6UHVwjavVf57MinRWTuGkPp/mSeoJP/RwE
 dwWqRwdjPS6vEQAiyTuq9xDY4ni9Gx/n3XRdwlquloz2QLBDmvm94n1yktuGN+kgWoTf
 3ZKw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1770885252; x=1771490052;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k0/wFe+2io5iVKVbQo0EV0I44bf5kR97kXAKzX4kik8=;
 b=J4w19vSSWAKqmgzC8Tf/bMPNToQMAva9MXkZ4iNFvgZkcmuBZh9AgE0YeKRw2flNUc
 V+5AR58yu+k6lbeZQizj4qui9P+VlpqZyn5lOOlfFfzzj+0mm8TRrN3GY6sfTUgHZWxt
 R/Ygy16FkjG0kWPCovBr8CKUcSQN/74HInbQEb7i/lEv0ttn/18yjhtXnOYBY5oCRMOK
 3VUYIPDKoVBzox4z3110OE6iJ8K9B+OgKBWxcAjC6AsXbIQq6FXFuEck4bhb3JbDBezE
 yCsHq+n8CkhXv4zvFm1r1sc/EtOlDFpMbqPQHbaDuxhaJrcw7GvBZk3jw/NRv3oVx5iD
 tZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770885252; x=1771490052;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=k0/wFe+2io5iVKVbQo0EV0I44bf5kR97kXAKzX4kik8=;
 b=eWyGxkSoBLA5Lsz1Y7P0hbYRcCgXb/zdeDbd0kboYHGmwHKXYys4bxxTHOheU2Wh4s
 FPibdYU1I/PshrqKQ5SOKkafKLmCQPIMQoye1IXuFWt3YRcLWq0qB1oB95Mk5A6Vumn0
 Ei2GzFtTQKAMHhJLs09K5OgbQqA9ghG/SrFdVC70Yfn9L3DJzpU9e+YzqzI+MLKMGbX8
 RR+cE4JCOHp0MaJsJImPsn8POtq/yveRfVif/3xETonDiiX28jrSDLa6jJGGVq8S2Nq4
 9TUl4nPGJ7eCwC1LODdWQo/5ojKwNgXp7TxvYXgQicOrurRgEbdNdYH0H/BnT0UpZyO7
 Tl2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUW8rRRnfVAw5T7o8eh5fffzl63F8YZp+d5CxzbNBXtJRR0ib4NwZ0LaV1EcbHCmS2IP2pPagjtNHs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxq3CLW024IkeGoJ1Vc5OmJUGmti6hrj+lTM2wxFNWFgcPorK77
 sBtKrrOoA+P8e2BMw/+HODTbiZPt+AMHNStOSKEsXVsUhQmoVWo4gk1Q7iCpZQDrV2/vpNbmV/K
 fQ7EXCp4w83jJJISnt6TTx4YligDk6SgUKggp/sY9yTiPZwKbtUmI36AUPjmIcBUW+evM93xkXj
 h4em5ATXc3fCVZ9WLUZlVSS6P9BjloJqTQOxpuddzZ62t7Aw==
X-Gm-Gg: AZuq6aKTqwn0MHUCky575PtY0lMQrWA35qLNDjPg9epQ7DH/WGOeRxFPWpFLLTBmZUd
 1CrWRj2TSDPTp0131zcEAMdZeehEGIR/+jKTdUd7YvFMeMIBZevrWSchiXYkfB4AK6YJPe1Q4gB
 jn/QR6S8OhzGEWKZa5wpHFFeJYE7Yt9u2vDrGOusydd/vuMh66e8UUbx04f3IpCwPkSpHfybQlO
 +fNaUKJ/+KmkZaeF3THNjFPG3gH13Z/hLBm+bRk
X-Received: by 2002:a05:6214:ac5:b0:895:3b72:ecf8 with SMTP id
 6a1803df08f44-89727899bc1mr34422366d6.17.1770885252052; 
 Thu, 12 Feb 2026 00:34:12 -0800 (PST)
X-Received: by 2002:a05:6214:ac5:b0:895:3b72:ecf8 with SMTP id
 6a1803df08f44-89727899bc1mr34422086d6.17.1770885251620; Thu, 12 Feb 2026
 00:34:11 -0800 (PST)
MIME-Version: 1.0
References: <20260211-anx7625-fix-pd-v1-1-1dd31451b06f@oss.qualcomm.com>
In-Reply-To: <20260211-anx7625-fix-pd-v1-1-1dd31451b06f@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 09:34:00 +0100
X-Gm-Features: AZwV_QioAG5TBOBomftAwlhd2qKRd1stx-r_6APCiDLaujFRLaJVZuUtbrulnnM
Message-ID: <CAFEp6-0Z1+mZrRyFw4gWQrOcSARVJqYSRxbjorquW5WDRsJR2A@mail.gmail.com>
Subject: Re: [PATCH] drm: bridge: anx7625: correctly detect if PD can be
 disabled
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Xin Ji <xji@analogixsemi.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA2MiBTYWx0ZWRfX0UUvhkTiljvy
 6gnaPaX35+ffjmFPfPkeJ2uizsgBMjJ1rHx+ABXAdE7FbmNg6TXIUjrBHNKFIj/NjneJ13oDTJe
 nPx6sHJec9mrvpAzRaer6OzRbTcB7LHncrXOf1S9wtHyi8uCBl9hQdfFmBcYLyBaZS/C5u9iU4i
 EufTgcE+xxbWIaqpFjQzJnVrlOyVN176KWPw5A7CKNEbIYcFxlFJlQVN3pxHA1ZQ8ZpvEGxNt9T
 PzpVUICE7Er7wijdtdcjM2rNlUNNLlD+AdlMg6bDy1CCSNhe4ULuvJCRynvdc6GhNps6VVof0u5
 hHnBih3cJTIq/9GDOtj28r0w2jUBVOaAhQ+f42Qi0tsbE2DNIZS3HscHPl/lmFCD6PNmRwgsf/C
 2sLLyULQP05dAAKb+JoUSIAoZ2zMwcj2bLyEywgHvp1g0rSsI8zd3Kullsu1N4ZaNUg2fY0duW4
 vwVlzy0NO5lYu8LrzRw==
X-Proofpoint-ORIG-GUID: eFwd9ab_gtzwBUCLf8aVZcZdTt6ei-eF
X-Authority-Analysis: v=2.4 cv=INIPywvG c=1 sm=1 tr=0 ts=698d9085 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8 a=QU0g_BdTwL8rEfZLB5kA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: eFwd9ab_gtzwBUCLf8aVZcZdTt6ei-eF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_02,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120062
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
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:xji@analogixsemi.com,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,analogixsemi.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: A8F5E12B5D6
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 10:17=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> During initial checks the ANX7625 bridge can be powered on before
> setting up the Type-C port. At this point, when
> anx7625_ocm_loading_check() checks if it can disable PD or not, it will
> notice that typec_port is not set and disable PD, breaking orientation
> and HPD handling. Unify the check between anx7625_ocm_loading_check()
> anx7625_i2c_probe() and anx7625_typec_register() and check for the
> presence of the "connector" node.
>
> Fixes: 8ad0f7d2e6fd ("drm: bridge: anx7625: implement message sending")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Tested-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/=
bridge/analogix/anx7625.c
> index c43519097a45..1157a58cf1b1 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -1363,6 +1363,18 @@ static void anx7625_configure_hpd(struct anx7625_d=
ata *ctx)
>         anx7625_hpd_timer_config(ctx);
>  }
>
> +static bool anx7625_need_pd(struct anx7625_data *ctx)
> +{
> +       struct fwnode_handle *fwnode;
> +
> +       fwnode =3D device_get_named_child_node(ctx->dev, "connector");
> +       if (!fwnode)
> +               return false;
> +
> +       fwnode_handle_put(fwnode);
> +       return true;
> +}
> +
>  static int anx7625_ocm_loading_check(struct anx7625_data *ctx)
>  {
>         int ret;
> @@ -1378,7 +1390,7 @@ static int anx7625_ocm_loading_check(struct anx7625=
_data *ctx)
>         if ((ret & FLASH_LOAD_STA_CHK) !=3D FLASH_LOAD_STA_CHK)
>                 return -ENODEV;
>
> -       if (!ctx->typec_port)
> +       if (!anx7625_need_pd(ctx))
>                 anx7625_disable_pd_protocol(ctx);
>         anx7625_configure_hpd(ctx);
>
> @@ -2924,12 +2936,7 @@ static int anx7625_i2c_probe(struct i2c_client *cl=
ient)
>         }
>
>         if (!platform->pdata.low_power_mode) {
> -               struct fwnode_handle *fwnode;
> -
> -               fwnode =3D device_get_named_child_node(dev, "connector");
> -               if (fwnode)
> -                       fwnode_handle_put(fwnode);
> -               else
> +               if (!anx7625_need_pd(platform))
>                         anx7625_disable_pd_protocol(platform);
>
>                 anx7625_configure_hpd(platform);
>
> ---
> base-commit: 400a84e1f7a3681ef24d58d49b5d07e81c14f4e9
> change-id: 20260211-anx7625-fix-pd-792609132331
>
> Best regards,
> --
> With best wishes
> Dmitry
>
>
