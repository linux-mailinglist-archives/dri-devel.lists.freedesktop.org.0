Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EBD7D3F33
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 20:24:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CA5610E056;
	Mon, 23 Oct 2023 18:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0419310E037
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 18:24:35 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-507a55302e0so4930442e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 11:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698085474; x=1698690274; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=AXl7QD45QL6sivgQCN1vZsJFBc1tqDJMcsR0n1+9ZVA=;
 b=LT8FbZ93X4p7oYlOYSFqiKHIzjZZWhcDYwv+LVap0tsE8JOaEP6exKeIpTCUjkPMPB
 rmDXSoFZw3JZoOtcCZ7p0lEu0X9LM/NPZu8nDnz2UCJFQLgzGHkLf9FY8DU/bLHBGxc3
 rnbFWRO/g2w+XEoAUkZFNW8+YYunedJV26LToFCZpeubw4APLD4jdvE5CGjXT/3DLJZj
 8LnYFY/FOCIXdXI6WK7Yo42mTDwpx7vB96JxDQoNpubzIRUH9sje6OpEur+yhM9SZi3l
 tCTIre6KBmxm3jaSqxWxJrTcMaliXmrVk6qRG+olviN88h3jgvP2bU0q7YUS5DOmBBeZ
 wf0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698085474; x=1698690274;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AXl7QD45QL6sivgQCN1vZsJFBc1tqDJMcsR0n1+9ZVA=;
 b=TSLrq6/YMjSqcN6ZsSJNjp/NaXuA8bB97Pp6DCQjgtJ6V4aurUgBm4KsLSq7T7V5QJ
 WExlplzKy91a2HfJAWYRIVb7NvVSITchC8umF71asnJo2807icZxWwq1ZZ8tzp3RYdBE
 17qAuqF0+XOdL5pYqxI8aboBHGtP7u6doMUbHF5wzTYcXpyJ1R9EW7DnQAc3aAnE2FQB
 k+utn09fSl7VNMydxTdr9DW7ZlzQ9Mz7inNughMX8juAPoZvIWy/eZ32Sh1nUlbPjehy
 n8n6xg8GqSMw4fajtWAT5x59YXN8oUrIDMCey1ayRrQOpdxwupTlQVyKUKGReJivP6ve
 m09A==
X-Gm-Message-State: AOJu0YyHj062jFU8KSIpcPK/arJ2TlA0/aD4dv1AkTUNmZaNvQiYcDRX
 4FSIUfbVzLysT9LDSH2VSqt0nQ==
X-Google-Smtp-Source: AGHT+IHkBgeiF76Bx8knzqTGYbXJFudDOPHcgula2SENkD2657KkYSAFEtuZJ/OAVh+6CzJaf2DBDA==
X-Received: by 2002:ac2:5456:0:b0:507:b074:ecd4 with SMTP id
 d22-20020ac25456000000b00507b074ecd4mr6516885lfn.7.1698085474021; 
 Mon, 23 Oct 2023 11:24:34 -0700 (PDT)
Received: from [127.0.0.1] (85-76-147-63-nat.elisa-mobile.fi. [85.76.147.63])
 by smtp.gmail.com with ESMTPSA id
 z19-20020a19f713000000b00507a3b16d29sm1785836lfe.191.2023.10.23.11.24.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Oct 2023 11:24:33 -0700 (PDT)
Date: Mon, 23 Oct 2023 21:24:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [RFC PATCH v1 12/12] usb: typec: qcom: define the bridge's path
User-Agent: K-9 Mail for Android
In-Reply-To: <ZQRKq7K8jKlH/Y4X@kuha.fi.intel.com>
References: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
 <20230903214150.2877023-13-dmitry.baryshkov@linaro.org>
 <ZQRKq7K8jKlH/Y4X@kuha.fi.intel.com>
Message-ID: <0F1BE090-92C4-4233-A77A-9B4C653DA1A7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
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
Cc: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Janne Grunau <j@jannau.net>,
 Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andy Gross <agross@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15 September 2023 15:14:35 EEST, Heikki Krogerus <heikki=2Ekrogerus@linu=
x=2Eintel=2Ecom> wrote:
>Hi Dmitry,
>
>On Mon, Sep 04, 2023 at 12:41:50AM +0300, Dmitry Baryshkov wrote:
>> In order to notify the userspace about the DRM connector's USB-C port,
>> export the corresponding port's name as the bridge's path field=2E
>>=20
>> Signed-off-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>
>> ---
>>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec=2Ec     | 11 +++++++----
>>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_drm=2Ec |  4 +++-
>>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_drm=2Eh |  6 ++++--
>>  3 files changed, 14 insertions(+), 7 deletions(-)
>>=20
>> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec=2Ec b/drivers/=
usb/typec/tcpm/qcom/qcom_pmic_typec=2Ec
>> index b9d4856101c7=2E=2E452dc6437861 100644
>> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec=2Ec
>> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec=2Ec
>> @@ -156,6 +156,7 @@ static int qcom_pmic_typec_probe(struct platform_de=
vice *pdev)
>>  	struct device_node *np =3D dev->of_node;
>>  	const struct pmic_typec_resources *res;
>>  	struct regmap *regmap;
>> +	char *tcpm_name;
>>  	u32 base[2];
>>  	int ret;
>> =20
>> @@ -211,10 +212,6 @@ static int qcom_pmic_typec_probe(struct platform_d=
evice *pdev)
>>  	mutex_init(&tcpm->lock);
>>  	platform_set_drvdata(pdev, tcpm);
>> =20
>> -	tcpm->pmic_typec_drm =3D qcom_pmic_typec_init_drm(dev);
>> -	if (IS_ERR(tcpm->pmic_typec_drm))
>> -		return PTR_ERR(tcpm->pmic_typec_drm);
>> -
>>  	tcpm->tcpc=2Efwnode =3D device_get_named_child_node(tcpm->dev, "conne=
ctor");
>>  	if (!tcpm->tcpc=2Efwnode)
>>  		return -EINVAL;
>> @@ -225,6 +222,12 @@ static int qcom_pmic_typec_probe(struct platform_d=
evice *pdev)
>>  		goto fwnode_remove;
>>  	}
>> =20
>> +	tcpm_name =3D tcpm_port_get_name(tcpm->tcpm_port);
>> +	tcpm->pmic_typec_drm =3D qcom_pmic_typec_init_drm(dev, tcpm_name);
>
>So I got some questions and concerns off-list=2E This was one of the
>concerns=2E That tcpm_name is now the actual port device name, so I'm
>afraid this is not acceptable=2E
>
>You can't use device name as a reference, ever=2E There is no way to
>guarantee that a device with a specific name is what you meant it to
>be by the time it's accessed=2E

Hmm, could you please be more specific, why? I mean, class devices are not=
 that easy to be renamed in sysfs, are they? Or are you concerned about the=
 device being destroyed behind userspace's back? At least for MSM this will=
 be a huge problem already, with the bridge driver suddenly being removed=
=2E

>
>If you need to deal with a device, then you have to get an actual
>reference to it (class_find_device_by_fwnode() should work in this
>case)=2E
>
>Ideally you would get the reference in the place where you actually
>use it (so drm_connector=2Ec or more likely drm_sysfs=2Ec) but that would
>mean a dependency on typec in there, if the component framework or
>something like that (device links?) is not an option=2E You could of
>course try to confine the dependency somehow=2E drm_class does not have
>implementation for dev_uevent, so you could take over that as a
>temporary solution=2E
>
>The only way to avoid the dependency completely would be to pass that
>device reference from here through your drm bridge chain somehow=2E
>But that's also really fragile=2E But it could be acceptable as a
>temporary solution perhaps, if it's even possible=2E
>
>Br,
>

