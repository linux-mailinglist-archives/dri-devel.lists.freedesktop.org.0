Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6100360C496
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 09:01:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EEA610E1CF;
	Tue, 25 Oct 2022 07:00:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0179310E0F9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 03:23:49 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id jo13so6526264plb.13
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 20:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f9FEmbC5xpjHJg/2O8DNlMMB4H4G84Faq1RNdC5/70Y=;
 b=J6AoKAQCxSkBd/sowbwPCi6ub1mPxV0qlHWX0WF7X3NIlYQn4YHES82Srn6p4epgIr
 I/r34Cbt1RAn8twGDRZkfGNfzOPw/CE/lQ3d8KKm/xk0O0byOMZgfEBxXin8xMsH6Ae4
 OYdMDc09gEwKmklQ38eKDQ1EP/Ifp9975kI3vOWpMT2+B7APWMDg1HWdHh6RDm2IhmZp
 nFlQWBQ5LXCjatGUOm0Nssz0irDhTOK5bRfoLWDBGVjr3x7Zn+3TjCCDg34vvNahoMXf
 /GTBMcEoPm5pkxKRsBe/cZklokeE7OuhvhWmNxe9o2BV3Dg9u2aHkD+tP04uQVNOH6VR
 XDtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f9FEmbC5xpjHJg/2O8DNlMMB4H4G84Faq1RNdC5/70Y=;
 b=rSRJvrww9TqDR/WveTdViMJ+ZEJFEDphP+VXtTFgCTvEWavC7wKB76ry3vXFTBPveu
 5OY2kkFlaicv//j/UNoAyfpQSnZZmY+fJI20lrfuAvuhIaZtt2XlzLIE/V9wzH55KT82
 Ez3//Gq0ke1GBo/3elDiULB44Qix196SLdlkW1z30II5EAWRiilLXkC7VUGUlUZdO/VI
 GyrOtx6B2UqAOh/L/+sOegg3+NU0ZfexMomKBcg8cGnxqysNAAn9JKK9HVSTmsCREZEw
 ZynwX9enAQzkVIlVFdbBDSPFLiFTGCQX07dsVZ1qxGnq6+koUchcBpqf8B6XfQ6q+JXA
 qChQ==
X-Gm-Message-State: ACrzQf2WURWWrTI+CDRTn2P9NMU+BDl3YuEZkxqw3a2KT27lWnLozKhJ
 j+oHRJe0CLFzpXkLMvVrbo+eIQ==
X-Google-Smtp-Source: AMsMyM6T9pbgn5kWI4AmOtmghV7rd1u8oseHmlwr+2DnuT3VwNTxi88zyEHreGyjv+o07wkD42j/iQ==
X-Received: by 2002:a17:90b:4a47:b0:212:f7ef:1bd6 with SMTP id
 lb7-20020a17090b4a4700b00212f7ef1bd6mr13717346pjb.79.1666668229127; 
 Mon, 24 Oct 2022 20:23:49 -0700 (PDT)
Received: from ?IPV6:2400:4050:c360:8200:8ae8:3c4:c0da:7419?
 ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a170903111000b001868d4600b8sm397270plh.158.2022.10.24.20.23.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 20:23:48 -0700 (PDT)
Message-ID: <8ed65e3e-e0b9-05ae-b113-db9d649a1e5a@daynix.com>
Date: Tue, 25 Oct 2022 12:23:39 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 00/22] Fallback to native backlight
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>
References: <20221024113513.5205-1-akihiko.odaki@daynix.com>
 <746e5cc6-516f-8f69-9d4b-8fe237de8fd6@redhat.com>
 <edec5950-cec8-b647-ccb1-ba48f9b3bbb0@daynix.com>
 <60672af8-05d2-113c-12b9-d635608be0dd@redhat.com>
 <ea69242c-0bc8-c7bb-9602-c7489bb69684@daynix.com>
 <7373e258-f7cc-4416-9b1c-c8c9dab59ada@daynix.com>
 <ae3497ed-b68d-c36a-6b6f-f7b9771d9238@redhat.com>
 <78ad5d7b-4078-0b8e-f4aa-6c8113631359@daynix.com> <87o7u1drcz.fsf@intel.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <87o7u1drcz.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 25 Oct 2022 06:54:02 +0000
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
Cc: linux-fbdev@vger.kernel.org, Ike Panhc <ike.pan@canonical.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org,
 Azael Avalos <coproscefalo@gmail.com>, Mattia Dongili <malattia@linux.it>,
 Daniel Dadap <ddadap@nvidia.com>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jonathan Woithe <jwoithe@just42.net>, Jonathan Corbet <corbet@lwn.net>, "Lee,
 Chun-Yi" <jlee@suse.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, Robert Moore <robert.moore@intel.com>,
 linux-acpi@vger.kernel.org, Cezary Jackiewicz <cezary.jackiewicz@gmail.com>,
 Len Brown <lenb@kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>,
 Kenneth Chan <kenneth.t.chan@gmail.com>,
 Corentin Chary <corentin.chary@gmail.com>, intel-gfx@lists.freedesktop.org,
 acpi4asus-user@lists.sourceforge.net, Mark Gross <markgross@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, platform-driver-x86@vger.kernel.org,
 devel@acpica.org, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 ibm-acpi-devel@lists.sourceforge.net, Jingoo Han <jingoohan1@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022/10/25 3:11, Jani Nikula wrote:
> On Tue, 25 Oct 2022, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>> That aside, the first patch in this series can be applied without the
>> later patches so you may have a look at it. It's fine if you don't merge
>> it though since it does not fix really a pragmatic bug as its message says.
> 
> I think it's problematic because it needlessly ties i915 backlight
> operation to existence of backlight devices that may not be related to
> Intel GPU at all. The direction should be multiple supported backlight
> devices, across GPUs and connectors, but only one per display.
> 
> BR,
> Jani.
> 
> 

Unfortunately it is the current situation (even without this patch), and 
this patch is not meant to fix the particular issue.

This patch replaces the following expression:
acpi_video_get_backlight_type() == acpi_backlight_native

As you can see, acpi_video_get_backlight_type() doesn't take a parameter 
which represents the backlight currently being operated. The problem is 
known and documented in "Brightness handling on devices with multiple 
internal panels" section of Documentation/gpu/todo.rst.

The exiting solution is based on the assumption that no device with i915 
and multiple internal backlights.

Regards,
Akihiko Odaki
