Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1ECC4C513C
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 23:09:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B944910E9B6;
	Fri, 25 Feb 2022 22:09:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C937F10E292
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 22:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645826971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5PA9hg/jjTKbd4y1qX7Ux68wjGwVszX5ra4xkbOOiek=;
 b=SAXQnjTffBrkkXf84yXpQyobBf4trw+3AsaNsGw25gSPMtlAUJPCqhp5OxbNrxqJbjRxV9
 PAlouiSbsFde+PKZ0QF7zbVUA+wrcGdrTLxQTrfkzIE3ZeBrGTblDsI0aIbnul2mN5o4GR
 lvLvgVcH5f2Szi6qGFyTstJD7QCnAwc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-bmDaCGVzNb6HTe99Cb4PoQ-1; Fri, 25 Feb 2022 17:09:30 -0500
X-MC-Unique: bmDaCGVzNb6HTe99Cb4PoQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 m21-20020a7bcf35000000b00380e364b5d2so2008651wmg.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 14:09:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5PA9hg/jjTKbd4y1qX7Ux68wjGwVszX5ra4xkbOOiek=;
 b=Pr7DKghh2cyD4/DHhrXgIAUQhFRqsacZqCa0bZ2y7sGT0sX2l1pbAaP0XLXUkX7FxH
 mJM+Y9cr6P0Qvz/LymizaIzZ8aAWGcxTLoRRN9NqD4olqSAJOTXHTuYtYx5wYK5gkad7
 9By18tiiuvHA0sEnn6ITcXN06TIqFzQUS+S0ofCGmDXlBFc5KdYtta2K0zCVmA2OYyQW
 8TPO6mJqnviHtp1f758vFtuAbZFHut9pWswRe92ZLVHHn0D09XKtsAKUN1tfcSCsl+Gv
 FSKOsvbqW1vakwLGtMwcsFPs8a/bdrvktw6gyd/8hy1U0lIAlAOhUIUjQ8Q7QsWMCphX
 YpVg==
X-Gm-Message-State: AOAM531JIGv8udJ2Hd4LaJsbSQbB19q00gWsTp3AvCgM+8OdNsEU38CO
 fZ6AiIBKVRyyRQrk9QHxvzl3JaZOUb62xgSdmQSloVYED3KSMv/xp4zKaW6WcnAx5NOsPlqWCsM
 NSjQpUck4fkta4sKkpQwgd9+nO0YF
X-Received: by 2002:a05:600c:3483:b0:380:edaf:d479 with SMTP id
 a3-20020a05600c348300b00380edafd479mr4329863wmq.20.1645826969212; 
 Fri, 25 Feb 2022 14:09:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyRz8kqXC26lmDuZDgPn8lbcKVBuJ71tDPuJGSpWOnTZ7pH1GMfhj1Tg6aY60ZvqiZQtVKhzw==
X-Received: by 2002:a05:600c:3483:b0:380:edaf:d479 with SMTP id
 a3-20020a05600c348300b00380edafd479mr4329851wmq.20.1645826969002; 
 Fri, 25 Feb 2022 14:09:29 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a05600c154c00b0037df2e5d8c9sm4311870wmg.27.2022.02.25.14.09.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 14:09:28 -0800 (PST)
Message-ID: <b87cf8eb-a27f-5060-7941-3b374c2792dd@redhat.com>
Date: Fri, 25 Feb 2022 23:09:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 1/3] sysfb: Make config option dependencies explicit
To: Michal Suchanek <msuchanek@suse.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
References: <1f13e6f2-a87c-83ac-7119-8632c8c8ac8e@redhat.com>
 <a0fa41e9186653e4c41ad0a28259e5cdc71b1f66.1645822213.git.msuchanek@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <a0fa41e9186653e4c41ad0a28259e5cdc71b1f66.1645822213.git.msuchanek@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
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
Cc: x86@kernel.org, David Herrmann <dh.herrmann@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-efi@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
 Martin Mares <mj@ucw.cz>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-video@atrey.karlin.mff.cuni.cz,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ard Biesheuvel <ardb@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Michal,

On 2/25/22 21:51, Michal Suchanek wrote:
> efifb and vesafb requires sysfb implicitly but this is not stated in
> Kconfig. Add the dependency.
> 
> With that all drivers that require sysfb depend on it so it can default
> to disabled.
> 
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> ---

Thanks for the patch. This makes much more sense to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

