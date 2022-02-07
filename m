Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 665934ABEAC
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 13:55:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4710010F04F;
	Mon,  7 Feb 2022 12:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A4D210F04F
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 12:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644238520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kNPsP3YH2exjUNs4YZ7Fr14RR/f7aFx5cd+KFDAD6Vc=;
 b=Na5IfIH2exmszclU1NdlU12khDHZeXsQnraMzIMoZJ/TjmuK4Ld2UNAwNrYiAUkgBJoo+I
 D3f0A25nLvgDHnL1HLxnIINHVME6bU9hmn+Az1YVypLRktKRl/q19Q89iZ6O2MNNu2kUEu
 qNmWZwf5BwnJdvHUITh19fa1/X4wIc8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-gH4IzDysOeSHrhg6XedHMA-1; Mon, 07 Feb 2022 07:55:19 -0500
X-MC-Unique: gH4IzDysOeSHrhg6XedHMA-1
Received: by mail-ed1-f71.google.com with SMTP id
 n8-20020a50cc48000000b0040f345d624aso3596717edi.6
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Feb 2022 04:55:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kNPsP3YH2exjUNs4YZ7Fr14RR/f7aFx5cd+KFDAD6Vc=;
 b=y3Py5XFtCa4nOBlYUjKCppXAA1rSjt7vRSDshOVQAWeIZfnAmnyZbmAtOFpkPVaOFz
 Fc3oAi2CFWgkVGPkZgJfmq2Hc5tD8qv4YUefF+1wmddSCfM9vwW1VPtBSNAnKqFxF9sR
 2qvKP+dra0ckQiA+C9JVTy/AXyMRPy2p4+grdysGuiqU3WZsT6iFeKX9LyRncukTa9mS
 +rUFpOnSYVp1NCyZl0c2NeYlo1YoU9OPGvlNbkoIqfZMXErbccPwFJNBVwk+WO2LBtqZ
 kiBvW9E7kAsT74BugMe46viN72+daA+laaPaam/24b506E86+h3NcpDm7RUmJjWxzeWI
 NNdg==
X-Gm-Message-State: AOAM531IZVLbFpLBz2uvCgZshW4RI+MQJKHy7eFu6kxuLzUTZs8xvzi/
 41LqtX2U3E3SfYC26CWi54mnoa2JYI94ck4HpMy6P1jR7hYngFlnFWoxrg6DD9Bj6Qw3jEM8XcB
 /fy6sBMuUeMckMxjbnN5YzF3InRgD
X-Received: by 2002:a17:906:d62:: with SMTP id
 s2mr2904618ejh.176.1644238510122; 
 Mon, 07 Feb 2022 04:55:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxRKzMsiNXDskb9mR5gZwflLqjgDaaizZ60vofOz5ymVg4FdncoCyqSUIVrh6ddBR2kI3wKKA==
X-Received: by 2002:a17:906:d62:: with SMTP id
 s2mr2904606ejh.176.1644238509972; 
 Mon, 07 Feb 2022 04:55:09 -0800 (PST)
Received: from [10.40.98.98] ([78.108.130.194])
 by smtp.gmail.com with ESMTPSA id t8sm437295eji.94.2022.02.07.04.55.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 04:55:09 -0800 (PST)
Message-ID: <c7d5a207-a467-ebbf-cee0-b40223839efb@redhat.com>
Date: Mon, 7 Feb 2022 13:55:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] drm/privacy-screen: Fix sphinx warning
To: Simon Ser <contact@emersion.fr>
References: <20220126151105.494521-1-hdegoede@redhat.com>
 <oW_YQ9nS3nPTTNYd8OplqMpLezdIzohS4_PcYz5aI1bmv4SKcKRGNvqgJ9yJQWehrNgWWBxLhnzICHPylEc0yXIbVcQCuOdTTvVeKqUtGuU=@emersion.fr>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <oW_YQ9nS3nPTTNYd8OplqMpLezdIzohS4_PcYz5aI1bmv4SKcKRGNvqgJ9yJQWehrNgWWBxLhnzICHPylEc0yXIbVcQCuOdTTvVeKqUtGuU=@emersion.fr>
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
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Thank you for the review.

On 2/7/22 12:43, Simon Ser wrote:
> On Wednesday, January 26th, 2022 at 16:11, Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> - * A pointer to the drm_privacy_screen's struct is passed as the void *data
>> + * A pointer to the drm_privacy_screen's struct is passed as the void \*data
> 
> Maybe we can use @data here instead? It's used to refer to arguments or struct
> members.

It is not an argument to the function being described; nor is it a struct member,
it is the void *data in:

typedef int (*notifier_fn_t)(struct notifier_block *nb,
                        unsigned long action, void *data);


> Alternatively, use double backquotes to format it as inline code blocks:
> 
>    ``void *data``

So I'll prepare a v2 using this.

Regards,

Hans

