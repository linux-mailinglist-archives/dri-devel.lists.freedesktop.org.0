Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A93FC3A2FE9
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 17:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8100A6ED82;
	Thu, 10 Jun 2021 15:55:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D07FF6ED7C
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 15:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623340525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iZQG49OMdPKGkVDjxzrA9bmQ2IiyK39OfqmeMQ/HNjI=;
 b=Q5mN55avTcxInUR1ZgvjWQBqocRHkYOebEYEaElZKrCqLUvE730mA9js9gdU8nhCw5A+2j
 5y/9Hcetri1TncfF0Xk61IIE9ENCDikft5z29N0VzmMAOMf0uc3D3GQE0lflDI0/55Pe/s
 75Y6r8j7ckiB9vwll1b7JPrLP1l1e20=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-1IOFN2TTOtCANqG_TF7CjQ-1; Thu, 10 Jun 2021 11:55:22 -0400
X-MC-Unique: 1IOFN2TTOtCANqG_TF7CjQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 jy19-20020a1709077633b02903eb7acdb38cso9184796ejc.14
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 08:55:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iZQG49OMdPKGkVDjxzrA9bmQ2IiyK39OfqmeMQ/HNjI=;
 b=FfiZhUDPETG8f4rRCxRkp4Q1TT93THFgki8wLPy3+LsAkPy9PmHCOFEl+h0GdPg18j
 Jq5MV+C3lxb1T+ONYUZ8NYK+N7upBtdzfl88rEISR02ToxmCmvYLkgr92AxYPJPvKILU
 r2Owmq61+lzYcaQ4vFe0p0W0Fj2rGSKB02F09/WzG6OKaCrQ4sjI0RcsKDpjQHHWy9VX
 4mjA7MXD7Yi4iFW6q9D2kBr+ABrtYTUqHB4mlc0CDVYTiCt9plraqcdl1ll6+VvBqhJ8
 JNVU/TBYKLU4MK9hC6Ozm2qCOyUOyqs+hmGb5/0JlWooACZXUz4zmauwcIr+XtNVtTg9
 KqcA==
X-Gm-Message-State: AOAM532AX4GEWVSoJBMv7UarM0IzvRA5eqBe1ZgM4rJxziYokGq9syjV
 wq3ePNbDExNIw5wcys5Zpkxqlfrh+D3PrQ0Pt1b8Y1cfS/LjRro6swA91r7bbxHsmJEF3vxZyqv
 ANPFq+mRo4DXK8uR4b9Amy4njbyiO
X-Received: by 2002:aa7:c6c2:: with SMTP id b2mr162820eds.8.1623340520894;
 Thu, 10 Jun 2021 08:55:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzegUSmNkouCVxXgL5EpM34N2tl0oLxPr9grZP9q3YInG4mkvVxKvf1gpjZDLfSXaCu5fvtcw==
X-Received: by 2002:aa7:c6c2:: with SMTP id b2mr162805eds.8.1623340520764;
 Thu, 10 Jun 2021 08:55:20 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id jp6sm1224885ejb.85.2021.06.10.08.55.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 08:55:20 -0700 (PDT)
Subject: Re: Computation of return value being discarded in get_cpu_power() in
 drivers/platform/x86/intel_ips.c
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Colin Ian King <colin.king@canonical.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Mark Gross <mgross@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jesse Barnes <jsbarnes@google.com>
References: <548dd463-3942-00a1-85c3-232897dea1a3@canonical.com>
 <162332615476.15946.17135355064135638083@jlahtine-mobl.ger.corp.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <7e13032d-1472-9c50-1dba-9dcebc76729f@redhat.com>
Date: Thu, 10 Jun 2021 17:55:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <162332615476.15946.17135355064135638083@jlahtine-mobl.ger.corp.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: intel-gfx@lists.freedesktop.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 platform-driver-x86@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 6/10/21 1:55 PM, Joonas Lahtinen wrote:
> (Address for Hans was corrupt in previous message, which confused my mail
> client. Sorry for duplicate message, the other is without From: field).
> 
> + Jesse
> 
> Quoting Colin Ian King (2021-06-09 14:50:07)
>> Hi,
>>
>> I was reviewing some old unassigned variable warnings from static
>> analysis by Coverity and found an issue introduced with the following
>> commit:
>>
>> commit aa7ffc01d254c91a36bf854d57a14049c6134c72
>> Author: Jesse Barnes <jbarnes@virtuousgeek.org>
>> Date:   Fri May 14 15:41:14 2010 -0700
>>
>>     x86 platform driver: intelligent power sharing driver
>>
>> The analysis is as follows:
>>
>> drivers/platform/x86/intel_ips.c
>>
>>  871 static u32 get_cpu_power(struct ips_driver *ips, u32 *last, int period)
>>  872 {
>>  873        u32 val;
>>  874        u32 ret;
>>  875
>>  876        /*
>>  877         * CEC is in joules/65535.  Take difference over time to
>>  878         * get watts.
>>  879         */
>>  880        val = thm_readl(THM_CEC);
>>  881
>>  882        /* period is in ms and we want mW */
>>  883        ret = (((val - *last) * 1000) / period);
>>
>> Unused value (UNUSED_VALUE)
>> assigned_value:  Assigning value from ret * 1000U / 65535U to ret here,
>> but that stored value is not used.
>>
>>  884        ret = (ret * 1000) / 65535;
>>  885        *last = val;
>>  886
>>  887        return 0;
>>  888 }
>>
>> I'm really not sure why ret is being calculated on lines 883,884 and not
>> being used. Should that be *last = ret on line 885? Looks suspect anyhow.

This has already been fixed (yesterday actually) in linux-next:

https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/commit/?h=for-next&id=13c3b4f76073d73dd81e418295902676153f6cb5

Regards,

Hans

