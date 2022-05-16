Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 483E95284FE
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 15:10:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E89C510FC83;
	Mon, 16 May 2022 13:10:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D902C10FC8C
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 13:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652706603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iEaA2tnZIzL688whQHsLPEcROCQ8UyY9yGJytKyoelk=;
 b=CE1n0Jt4p4dFOl3Vo/kdsAyNM1bu2UgWx/cOFw+/Q16WoeE4FNKljUK2mbgqfqLh+V0vNi
 S5byk4K3n3KzPRMvdhlSlTpcEKidL0lh7A8w1YVI9P+C4ezk8ONYjJr69JtQCknvjppcHM
 Zdw650Hbw6TQYdrNIW0Je6JJY3xVYbg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-172-xsazr-w5PfmICQ4JDr65bw-1; Mon, 16 May 2022 09:10:02 -0400
X-MC-Unique: xsazr-w5PfmICQ4JDr65bw-1
Received: by mail-wm1-f70.google.com with SMTP id
 205-20020a1c02d6000000b003928cd3853aso10334556wmc.9
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 06:10:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iEaA2tnZIzL688whQHsLPEcROCQ8UyY9yGJytKyoelk=;
 b=BdC13QE0MPsUtX5oBmk2h6N4WopUdUKOugnBZl/0yLp7dh4r9H0q1EhQaNF1kAVjRi
 HT12r2WhU5ts2315kZCEOYtun0peleZBwoa/W5+oqU9ogK3ePCwTQ1PP3IA5bd4NGxvK
 gocg990//yXlVleSYb2L2CI7s6ITKcmW84S7RGFOBvOQ8pqn5bSd6e+mBxYmrLofarII
 VDZam0OO7xSOKGOrxahKNAeFD/zlQXpRgNxruj5cDiWSM0QkNuqZW3zpQdZipRFhBwrs
 e/k51leFvALZG1H0ygNNkafWUi4pzFJR/rS7uOyeqCMMs2GNCQcmn/za39gecUW1Xdea
 dpKw==
X-Gm-Message-State: AOAM530IKsrAgici3P9FNf0Lq5bY+yp4te56ArOOJtXns6N89Sn1m6Wx
 az/QujVcHyYtQomD/TzUuRKMnZ7sda1T6qUKPemnZMiXlniqjrUzrMaxdOvvgaPY9kKN+FrKlSj
 VUtQh+AMR1DnJ07Spq42zVrH7SV692dqCZSQfr+pOMY0IZDZxHttKsFlwY0GLbVq8bmadF8C5kC
 kew3pJ
X-Received: by 2002:a05:600c:3b9e:b0:394:69e2:267a with SMTP id
 n30-20020a05600c3b9e00b0039469e2267amr26796065wms.35.1652706601278; 
 Mon, 16 May 2022 06:10:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSMA6HepumxtOhm9ZXkqyOtSlAykMlWY0woLctA0EeeTvzB3DOEqNCTOXDQ+WMRyo5GkXFZg==
X-Received: by 2002:a05:600c:3b9e:b0:394:69e2:267a with SMTP id
 n30-20020a05600c3b9e00b0039469e2267amr26796045wms.35.1652706601104; 
 Mon, 16 May 2022 06:10:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:f4b2:2105:b039:7367?
 ([2a01:e0a:c:37e0:f4b2:2105:b039:7367])
 by smtp.gmail.com with ESMTPSA id
 p39-20020a05600c1da700b003942a244f4esm13533984wms.39.2022.05.16.06.10.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 06:10:00 -0700 (PDT)
Message-ID: <a80d8c20-ee90-f18e-7bb1-f2ccd838a767@redhat.com>
Date: Mon, 16 May 2022 15:09:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3] drm/mgag200: Enable atomic gamma lut update
To: dri-devel@lists.freedesktop.org, lyude@redhat.com, tzimmermann@suse.de
References: <20220513084900.1832381-1-jfalempe@redhat.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20220513084900.1832381-1-jfalempe@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jfalempe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: michel@daenzer.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I pushed it to drm-misc-next.

Thanks,

-- 

Jocelyn

