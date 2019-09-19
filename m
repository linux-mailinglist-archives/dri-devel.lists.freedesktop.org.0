Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7710CB8C05
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 09:53:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF45E6F8CF;
	Fri, 20 Sep 2019 07:53:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 827366F55F
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 21:41:00 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id p10so4546032edq.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 14:41:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dEP4asvWahvB/ByMxaI4e4W6i3Uh1P6APAc6QuG8yno=;
 b=YA/kshM2+2gK7lNTgIoSlSxvV1SXpNahdhgSw3lmGPKcAQ5Ck0vH6Ns21RYJkQzSIQ
 LuOokQu6pW7lvwDsout+kiSRpneeG04pFFdXqFhVkjqodr58v7JqQG/A56FhaIk08M9F
 sOzz5lql/zsS7Wg8jWfDbRPcHfUaPFdXEDI1otFyatX38Pv8JpEyhqftd65riEqsIhoK
 u1gq3bhne+NjK2ouQgL1Avpp6h7JOetVyTHbrQtqMe7uGNQnALji4sKSUeLWv7QSNNFc
 yveI7BhqKQNeRQ6odoIeIW1ZrkgO2+bvJpYVE5pGps67k60ygbIr8ff7DRZJp1CAi0O4
 wqiQ==
X-Gm-Message-State: APjAAAUHvzOUbNzUygnzClrDoUcxd9LDuYbeXsPTAJ8Q27wZM+FTrCK1
 inN+qibFfZ3FKxBXoULvaTZ0FWwVDC4=
X-Google-Smtp-Source: APXvYqw0IsdhqgUdWTmKGnFHNgvJQHvFA94OR9Wdz8/SIJZtgEfSqG8dg/BLFL29jU1G+9Y5MfUFBA==
X-Received: by 2002:a17:906:1312:: with SMTP id
 w18mr16475379ejb.149.1568929258755; 
 Thu, 19 Sep 2019 14:40:58 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com.
 [209.85.128.44])
 by smtp.gmail.com with ESMTPSA id f21sm1629892edt.52.2019.09.19.14.40.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Sep 2019 14:40:57 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id y21so51717wmi.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 14:40:57 -0700 (PDT)
X-Received: by 2002:a1c:110:: with SMTP id 16mr27409wmb.88.1568929256997; Thu,
 19 Sep 2019 14:40:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190828183758.11553-1-rrangel@chromium.org>
In-Reply-To: <20190828183758.11553-1-rrangel@chromium.org>
From: Raul Rangel <rrangel@chromium.org>
Date: Thu, 19 Sep 2019 15:40:45 -0600
X-Gmail-Original-Message-ID: <CAHQZ30AGSxmjn4q6=bi6dJO1uSdpcG5jPGfUX7R2t2489qt9gw@mail.gmail.com>
Message-ID: <CAHQZ30AGSxmjn4q6=bi6dJO1uSdpcG5jPGfUX7R2t2489qt9gw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amd/display: fix struct init in update_bounding_box
To: amd-gfx@lists.freedesktop.org
X-Mailman-Approved-At: Fri, 20 Sep 2019 07:51:39 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=dEP4asvWahvB/ByMxaI4e4W6i3Uh1P6APAc6QuG8yno=;
 b=BmDj/yVXQI1xNehGBnaYafRi6EGb9bKgZd31R41qDqeJeU7zMho89QecXC+w2uIsh2
 06xxE6KKmvtBFgXmmxpi8gh0LjFMbEHLCkAMiBsQcYWYdDXd6CHyYwfani0b8ENaleZq
 5+x/lDA7+CqTzQa8/5dvIrCX9BmVycjFGxTHk=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Charlene Liu <charlene.liu@amd.com>, Leo Li <sunpeng.li@amd.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Nikola Cornij <nikola.cornij@amd.com>, David Airlie <airlied@linux.ie>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 hersen wu <hersenxs.wu@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Jun Lei <Jun.Lei@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJpZW5kbHkgcGluZyBmb3IgcmV2aWV3LgoKVGhhbmtzCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
