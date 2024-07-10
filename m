Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 693AC92D78B
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 19:36:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E44D710E852;
	Wed, 10 Jul 2024 17:36:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="NuXz6olN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C7910E853
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 17:36:00 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-79ef7ecc7d4so2544085a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 10:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1720632957; x=1721237757;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=crXHuoCnWWxv6iDdm0t07OpWrmAQmRLaORcG897D/1M=;
 b=NuXz6olNy7jmWIuCqyNmkOJVpvQ3Z2Ks3z+ugKCO9Vy4/RRRrTL1YUltHZKOpr19Ss
 NlbQHS9AoWG9k9NnVjjbl3eumMclztOp8YFWAatN12/0fuDnQOEKHVrHT3kFdUm5ZJNQ
 t4G5JhPCyw3oEC59NcqvqLTx3yikt/2QdDkak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720632957; x=1721237757;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=crXHuoCnWWxv6iDdm0t07OpWrmAQmRLaORcG897D/1M=;
 b=l7utwVnM0jvsa2iqmVotw8rIwhSgkBrhBEGyB0cIaAYgMsWjv9sVWRAJrDIRuHEWSx
 thIqhejw5mAsaTTM9sFrD01p2BCzQf8mzoVbfwsCDK42MIyvSdyxTblaCBz4dbcUCRtt
 gmwbsnqyKU/HcrLXOrTet07P1Jw7vttzdjmxHXeO5tOxW/WC/ckA06iJJBxNJ/Nv1QWi
 Y13eDoCID/P23FK6C7cyxah28oNJ88WiB1tL57UvT/61CdlzqBE6S8DmyRtuZTvLiRFY
 caawHfjoUYM9fzSSZrCaOOW9eqev1Yd1ACLJ2vktcDxiPjzG9uxRM/7xwSkJoS9b9OXy
 HFRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW89+Zi13J6dfLvhprVmTvAxUrYv95jXyp03+qO9LHQn+dRHlCr6BzpWdb8+/tmTB5S5PQ/yfkdv7ceFHV4R1C9rVlbuK2h5l1Js3N2bVUX
X-Gm-Message-State: AOJu0Yz2kTlgNP7GHvIUy1AaicVzqDASmv1WognwEMBDuOs21T0Bhqkv
 m4XBoW6JoWD1MqAhSradU33WNtpmOTfzLl3qroEtLf7DcI3g/VRfcXMnYCH26BGVVLWnnpdyRhe
 Qtw==
X-Google-Smtp-Source: AGHT+IG4Y+flVczX9xplZyPO7Kb8hBDfocl5wzg/0TaZhMgPf6L9kd0X1W/UiA050+W4OMSHipZxKQ==
X-Received: by 2002:a05:620a:a5a:b0:79f:62a:808 with SMTP id
 af79cd13be357-79f19a9c3f9mr615119785a.61.1720632957069; 
 Wed, 10 Jul 2024 10:35:57 -0700 (PDT)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com.
 [209.85.160.172]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79f1909c9a2sm212550885a.100.2024.07.10.10.35.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jul 2024 10:35:53 -0700 (PDT)
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-44664ad946eso13921cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 10:35:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWlxO/vzSv6Q5fJ655JTnsXAfQcF9Kb2biCLYJMOKxHzvSDRbe0BVdyQpVm3a4lrF7hz2Zjw47RjC2p0lkLXj3RIBZOc2svh1GHCBM2d3qw
X-Received: by 2002:a05:622a:7604:b0:447:f5de:bd18 with SMTP id
 d75a77b69052e-44b191f6ac5mr3688571cf.9.1720632951079; Wed, 10 Jul 2024
 10:35:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240710-x1e80100-crd-backlight-v1-0-eb242311a23e@linaro.org>
 <20240710-x1e80100-crd-backlight-v1-2-eb242311a23e@linaro.org>
In-Reply-To: <20240710-x1e80100-crd-backlight-v1-2-eb242311a23e@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 10 Jul 2024 10:35:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X5rJUNq_QUBf7WMrof+9rh9Jhb5zoqK=Y6jqUUi2Nt3g@mail.gmail.com>
Message-ID: <CAD=FV=X5rJUNq_QUBf7WMrof+9rh9Jhb5zoqK=Y6jqUUi2Nt3g@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm/panel: samsung-atna33xc20: Add compatible for
 ATNA45AF01
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>
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

Hi,

On Wed, Jul 10, 2024 at 10:05=E2=80=AFAM Stephan Gerhold
<stephan.gerhold@linaro.org> wrote:
>
> The Samsung ATNA45AF01 panel needs exactly the same non-standard power
> sequence as the Samsung ATNA33XC20 panel for backlight to work properly.
> Add the new "samsung,atna45af01" compatible to the driver to make it hand=
le
> these panels as well.
>
> While ATNA45AF01 would also work with "samsung,atna33xc20" as a fallback
> compatible, the original submission of the compatible in commit
> 4bfe6c8f7c23 ("drm/panel-simple: Add Samsung ATNA33XC20") had the timings
> and resolution hardcoded. These would not work for ATNA45AF01.
>
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  drivers/gpu/drm/panel/panel-samsung-atna33xc20.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c b/drivers/g=
pu/drm/panel/panel-samsung-atna33xc20.c
> index 9a482a744b8c..fd56fd02df87 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
> @@ -333,6 +333,7 @@ static void atana33xc20_remove(struct dp_aux_ep_devic=
e *aux_ep)
>
>  static const struct of_device_id atana33xc20_dt_match[] =3D {
>         { .compatible =3D "samsung,atna33xc20", },
> +       { .compatible =3D "samsung,atna45af01", },

As per my response to patch #1, you don't need this change at all if
you just add a fallback compatible. Later if there is anything special
we need to do for this panel we can match against it, but right now
there is no need.


-Doug
