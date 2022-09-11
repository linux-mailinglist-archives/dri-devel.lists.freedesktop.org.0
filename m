Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2655B4CFA
	for <lists+dri-devel@lfdr.de>; Sun, 11 Sep 2022 11:24:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 453E110E3EE;
	Sun, 11 Sep 2022 09:24:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7191A10E3EE
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Sep 2022 09:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662888251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZTr9zcqSNEUm7yB/MR8ANREklkWwfdp1DcwxGTyc8fc=;
 b=TIMK0cVVbY7XjAhVYHVKhQ0wxMk3/G7ej23jKM8Kx/xMKW0HHWui50P5Kefv/CBJ9Pi6WM
 0pDZHWTr8nDgcwK8usLxtpfkW6+Ip+tgQRSrHP+Ixu0IZGW+U5sbJODrZzI039U5MibBp3
 t+Rj8pZrhmJ0aoSkbkfo1Z9dBtrjvJc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-568-WdnWt4MxOVKBfHhr4mPQUA-1; Sun, 11 Sep 2022 05:24:10 -0400
X-MC-Unique: WdnWt4MxOVKBfHhr4mPQUA-1
Received: by mail-ed1-f69.google.com with SMTP id
 y1-20020a056402358100b00451b144e23eso416958edc.18
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Sep 2022 02:24:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=ZTr9zcqSNEUm7yB/MR8ANREklkWwfdp1DcwxGTyc8fc=;
 b=FAXYfXKVyg+SOOpIJvGM8FlhLUvm15dThGKst35rM2yxMtJ740Av32UltyY4LydVyX
 EphMIh/lHn5kl8cSxuGrstb69b9Edb7ey/5QQm4uK9Ri+eQpAwXQ5B4WVAO2wQpTQY6t
 7ZClZP0o5yrANu8QvOM8iSRdfr2JT5eLXeC5OHkjleTiCze964SP7DZSBLl+JizZIpZG
 tiyTQkslzc/F4d54gsxTSK6Wbc23OwPelY5dIq5SqbJmleVh48Sa8ThFe9sSVFjDOLLa
 7qX2GvmekxnflstjDnmzy8tfScbHZqO5gGdYL9+Arp5IWJrnOce+EK5LvH/lbx5Ty4j2
 YKzQ==
X-Gm-Message-State: ACgBeo31Y5SDToB4LRO/waszFqRg10Fmac+OsqUaHVtbkGRchwyX4H/P
 Qshz0PwufxFnhKvNhu0dp/Ver3ynZStvIeVhkXliIUZQYvdhyYljFo/5xeXk0UaK1w+bNptga7j
 CPWLtSIx7yPWOm0RpMUB1CEJ4cihS2fRCPDIJTRj5cfydJ0+QVI0RXTJUrZQBbs4ahcZcqZc2Bl
 fBg33m
X-Received: by 2002:a17:907:a48:b0:77c:51b0:5aeb with SMTP id
 be8-20020a1709070a4800b0077c51b05aebmr2109366ejc.61.1662888248914; 
 Sun, 11 Sep 2022 02:24:08 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7LsI4sZ/MMVd3q0Kq4m+xLp6PT8XdIlemS1vCVaYtujLqFAcXA4BVxLStkoItz4/J+szOfXQ==
X-Received: by 2002:a17:907:a48:b0:77c:51b0:5aeb with SMTP id
 be8-20020a1709070a4800b0077c51b05aebmr2109349ejc.61.1662888248579; 
 Sun, 11 Sep 2022 02:24:08 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170906210200b00715a02874acsm2776619ejt.35.2022.09.11.02.24.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Sep 2022 02:24:07 -0700 (PDT)
Message-ID: <c3614f20-bfab-caed-d9b4-0bd244f698a8@redhat.com>
Date: Sun, 11 Sep 2022 11:24:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: Meeting (BOF) at Plumbers Dublin to discuss backlight brightness
 as connector object property RFC?
From: Hans de Goede <hdegoede@redhat.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>
References: <c796e05d-6c74-3011-89d3-226e54455f06@redhat.com>
In-Reply-To: <c796e05d-6c74-3011-89d3-226e54455f06@redhat.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

On 9/9/22 12:23, Hans de Goede wrote:
> Hi All,
> 
> I will be at Plumbers Dublin next week and I was wondering if
> anyone interested in this wants to get together for a quick
> discussion / birds of a feather session about this?
> 
> I have just posted version 2 of the RFC:
> https://lore.kernel.org/dri-devel/b61d3eeb-6213-afac-2e70-7b9791c86d2e@redhat.com/T/#u
> 
> If you are interested in meeting up please send me
> an email off-list (no need to spam the list further with this)
> also please let me know if there are any times which do not
> work for you, and/or times which have your preference.
> 
> I don't have a specific room/time for this yet, but if people
> are interested I will try to get a room from the organization
> and if that does not work out I'm sure we will figure something
> out.

I have a date, time and location for this now. The BOF session
is scheduled on Monday September 12th in the "Meeting 9" room:

https://lpc.events/event/16/contributions/1390/

Regards,

Hans

