Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D24FB5B590
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 09:13:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E720E89F2A;
	Mon,  1 Jul 2019 07:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B238489C7F;
 Mon,  1 Jul 2019 02:33:17 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id t16so5745746pfe.11;
 Sun, 30 Jun 2019 19:33:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=voTuoUFQ5KaHA9/02GEyUejKIGxwvgLp1Lvj8n/za7U=;
 b=U/q6lTgzkbsa6dwDjunGRqEyD85l9lUzi45847aEj36x/w6YDEnKIajZHKDj5D6VVk
 Ut/74Rd4JO6f32qg8WzOaztiXv7SHu4Ro4OiRLcOwa6Oh9IR6KpSu3O4SsNBj761pqsT
 LusD6Wxa17kurJty48/j85rIw7LIBGA4QEoKfvkeyQzpYWS/uefn7U7XKumYw8YbGK5W
 M8DOD+b+av1mJqiw7Eul7rK5D58YEYvgjdUvmVeaSZALiOr8r4nbEOMl1H8w3vdBF678
 Yf8cQyvizw5wB5qLK3rRl1G80S3L5Ho6oCv7XpNsIJT1Pmny3XJcVsACUcHElKon9ZlI
 udvg==
X-Gm-Message-State: APjAAAUHl4abat0F72QIWHqQWHCQeDpOJaWyWDBMB4gE9qbUxfGj7gzZ
 sKQa2SbnFRSXRLbhLvn8NPI=
X-Google-Smtp-Source: APXvYqz45LyiB74SXRb5IlkMYJhK6XQUsj4xhlQr19rhEqeZR/UpZjRFD1SD7oHU3Y5qMaVgBdmCgw==
X-Received: by 2002:a63:c34c:: with SMTP id e12mr21430883pgd.195.1561948397231; 
 Sun, 30 Jun 2019 19:33:17 -0700 (PDT)
Received: from localhost ([110.70.47.183])
 by smtp.gmail.com with ESMTPSA id h2sm7601838pgs.17.2019.06.30.19.33.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 30 Jun 2019 19:33:15 -0700 (PDT)
Date: Mon, 1 Jul 2019 11:33:12 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: nouveau: DRM: GPU lockup - switching to software fbcon
Message-ID: <20190701023312.GA4236@jagdpanzerIV>
References: <20190614024957.GA9645@jagdpanzerIV>
 <20190619050811.GA15221@jagdpanzerIV>
 <CAKb7UvhdN=RUdfrnWswT4ANK5UwPcM-upDP85=84zsCF+a5-bg@mail.gmail.com>
 <20190619054826.GA2059@jagdpanzerIV>
 <CAKb7UvgkEXtmJV67EXeBctgaOxM1D91fBbKw9oFMUaB1ZViZQg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKb7UvgkEXtmJV67EXeBctgaOxM1D91fBbKw9oFMUaB1ZViZQg@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Mon, 01 Jul 2019 07:12:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=voTuoUFQ5KaHA9/02GEyUejKIGxwvgLp1Lvj8n/za7U=;
 b=d2R/ldYm8Mj0uWNNTMxDFBqHDXXIy/363bp2oqf+P1kkrrgy3/gr808nrwy/TOOwjv
 sIyUHzLcZAPXUVe1TrXscMDs3Ox+yXAhZvzNa/JhAlT5PfSkqtG0ZLSDqL8SvDDPX9Tz
 BSGHi0+RU6f6rJS4qN5ioSuutGmsfLCUYV7TqzMJpxfOxn7D861whFL9PkGJRoPKferC
 IbL9GRimxAf9Qr6HBMq8qrf1RzZUszZrka6xIk3YodtrPg2XyEZHvSGE0Jyt1UKyfTsH
 bRHGlxwskmZV4fKYG6q1RHOz4qMWkrv2R2rbiJ5hdaNHnb9+lwQQN0CL1nrvOhilPkiI
 1ZyA==
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
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gKDA2LzE5LzE5IDAyOjA3KSwgSWxpYSBNaXJraW4gd3JvdGU6Cj4gSWYgYWxsIGVsc2UgZmFp
bHMsIGp1c3QgcmVtb3ZlIG5vdXZlYXVfZHJpLnNvIGFuZC9vciBib290IHdpdGgKPiBub3V2ZWF1
Lm5vYWNjZWw9MSAtLSBzaG91bGQgYmUgcGVyZmVjdC4KCm5vdXZlYXUubm9hY2NlbD0xIGRpZCB0
aGUgdHJpY2suIElzIHRoZXJlIGFueSBvdGhlciwgbGV0J3Mgc2F5Cmxlc3MgQ1BVLWludGVuc2l2
ZSwgd2F5IHRvIGZpeCBub3V2ZWF1PwoKCS1zcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
