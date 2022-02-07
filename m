Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1BA4ABBC5
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 12:40:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 927D710F8C6;
	Mon,  7 Feb 2022 11:40:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E4D310F8C6
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 11:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644234009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oFPichefqEzfYZRmyzRrxnVRsXD3RShlAG1dJmQ5Dm0=;
 b=W+gv44UDAQGqO06A7tjhTlJPC4RZ0Fbqei9cjXcR8bhEXZZ+3v7C4Td4ouUlFXN1wK8Wt8
 DDMYYd1WQpXOY2KQ7BShlwDibTdOQaLTopFqKIhRHktSXEKOWzccgRQiGiWwG0KwqsvDmF
 if7n4nrm/yEXrTmLOdE8BzDxeglBV9I=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-woi15WL0M8u8y_mWZe51cA-1; Mon, 07 Feb 2022 06:40:07 -0500
X-MC-Unique: woi15WL0M8u8y_mWZe51cA-1
Received: by mail-ej1-f71.google.com with SMTP id
 ky6-20020a170907778600b0068e4bd99fd1so4199291ejc.15
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Feb 2022 03:40:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oFPichefqEzfYZRmyzRrxnVRsXD3RShlAG1dJmQ5Dm0=;
 b=B4yKEwx7BDBXqLMm1C0byCfJrLZdNBq1+4QakGXhVYNNNjOcliY4FF/40mtZqqJF4V
 JdclKSyW8DteAV7AeUPO2W52FR9GrEPC2HbOLygSEkR/cab8C49jO7jKH5fgL24kGE+H
 09+mK7eCYCJrogEvlaJsenUDZZpp91Mj1nCrORwXL9h42gsnB3ezI9Pycgqj2ZkE+BFE
 a5F1KlGb5ahdHC/fAv3vYCpnxgZ3H+aqeduaQOeUxcW3hUak78X1aNFefveb8t3WKWIr
 9oKoKWk1x4VVnWZTNW1D2loz7y9G4YzUmT5cXAfURWomJTHXzfUqjeDAAzsxmuLvM4lI
 7ivg==
X-Gm-Message-State: AOAM533FAfkKecZBml/IBae1n8C0nZcYAbo08QZmGQLF6gvGJb08ltUb
 6XFKqFCZVC23rGpQy+vW/H5M7j6+gTOpv0QOaW+s7vCf4FQEWKy0XqTwNkqSG6yDXpLjMvGKOQZ
 7nVIZOoFeCvBNXZl+F8DYaWiQLoqT
X-Received: by 2002:a17:906:64d3:: with SMTP id
 p19mr4333237ejn.15.1644234006156; 
 Mon, 07 Feb 2022 03:40:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyXAR19QQryAJAfB4dyo3CLPJaBP6T6pWM2Nca4Lf81srGZARXh5jJy6PcsypykLbR+DLnrAg==
X-Received: by 2002:a17:906:64d3:: with SMTP id
 p19mr4333224ejn.15.1644234005991; 
 Mon, 07 Feb 2022 03:40:05 -0800 (PST)
Received: from [10.40.98.98] ([78.108.130.194])
 by smtp.gmail.com with ESMTPSA id o14sm3569147eju.118.2022.02.07.03.40.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 03:40:05 -0800 (PST)
Message-ID: <ec6f4a29-667e-6404-7e76-5cddec9f9e07@redhat.com>
Date: Mon, 7 Feb 2022 12:40:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] drm/privacy-screen: Fix sphinx warning
To: Simon Ser <contact@emersion.fr>
References: <20220207113307.346281-1-hdegoede@redhat.com>
 <b2uKM4hu2HeudPS1-qX16wSdpZX34TtBVBE0Tb1Rnf4XtB2WCDSaZ7tOzWhnIPWdij9_2MWjQyRWN6539u-zs-6kd58TDplvkC2cOpXTMM0=@emersion.fr>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <b2uKM4hu2HeudPS1-qX16wSdpZX34TtBVBE0Tb1Rnf4XtB2WCDSaZ7tOzWhnIPWdij9_2MWjQyRWN6539u-zs-6kd58TDplvkC2cOpXTMM0=@emersion.fr>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rajat Jain <rajatja@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Simon,

On 2/7/22 12:37, Simon Ser wrote:
> Reviewed-by: Simon Ser <contact@emersion.fr>

Thank you, I also have this very similar patch pennding (also a simple htmldocs warning fix).

Any chance you can also review this one? :

https://patchwork.freedesktop.org/patch/470957/

Regards,

Hans
 

