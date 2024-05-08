Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D728BF5C2
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 07:55:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 741C7113389;
	Wed,  8 May 2024 05:55:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Am7yZU/t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C6DF113392
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 05:55:12 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-34e7a35d5d4so2963312f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 22:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715147710; x=1715752510; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2kECfVH61gVXoLyEKuVmIWZjf9iy/udsb4pKdELyNgI=;
 b=Am7yZU/tAX08yQhM4i9xLefVaLYN2l8DxoDFZr1H7TBBXVOdrkqyiigHiLvRppmms8
 E96rCaY/me+EiuHs9LvvauyDi7FFSXOoFkzd3cZbfH7mLlHjlxD/30m+a4bcy8d1S5nT
 FUEAcznjgJBPWCf19GZp3ifZeDeOnhQYipLRz3gPYyZKXM8gC1BP2oIJ7S2Z4f6hw/Za
 OF+dMcgqNzA8PpxIWDwxTgr1AgppYkY7hZW7dCUjH9/bNyw0AL6jdET/IG/SuW4Jmu1l
 A8MAldlnnqnYRxt6R6qeyx+vadhuqgGwGkDrbPPi1FpNK+fqt8sV6OFs/43S48cf3k3Q
 qxGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715147710; x=1715752510;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2kECfVH61gVXoLyEKuVmIWZjf9iy/udsb4pKdELyNgI=;
 b=TkHLzXTH7ZMjROAZA2Lf9Y9IUQ/I9L18Ib39sjTP6Uu6bF8yW41/d6u5XDoZd1XHi5
 S4kmFQfzoj7al+o89jz4hgq+Jcrx3Sa9iDh/XTSXmNrlKpixdeJk2XHYsSo+MRXUp1NZ
 9S0iCBVJxDwNYPSRixUAnZqWuo88hKg6IKyN2Q8N2bRgHTV1zTVZSLucAh9iyOZetLWt
 DANsJNgKb0OdE3bEtMapIGCdvTYN9r53Aqp+/uwgis0O/nKWlkKx+lIwjws82EscEXce
 vtCEwdDpiZ0dVeXFFWF8RcLS32fYKB4v13/bqtM76Kdw3LvF2dehBg9iBMDeymwMhofT
 3BaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWByihFAPXZuiUhDMUDVAZfQR+QiNHMYHjrgFyNkR7WR0uolOqfc4L0Y+ijF89lNfaqfJ6HKbBJRkRFslY64hvbvL5TcIcThurb78zuSYv2
X-Gm-Message-State: AOJu0Yzv04SSXgZIEGGH1+4lICbInP4+t1/2jvj5FLlkVZ8aKBV/xG+q
 zPvfxXHglP/+9uzpNNWVg+IKVwXuCd9KwXBV6ur3pp6/qy7djZaS
X-Google-Smtp-Source: AGHT+IGmRYQwYE5GKCP4nHrkMb9CRMRKCaP4q6oTy76fGgGdxl/Be2mRpgRLYl8OhhNTkkldystArg==
X-Received: by 2002:adf:f0c8:0:b0:34e:3cb3:6085 with SMTP id
 ffacd0b85a97d-34fca81043amr1370408f8f.62.1715147710492; 
 Tue, 07 May 2024 22:55:10 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 w6-20020adfcd06000000b0034dcb22d82fsm14415768wrm.20.2024.05.07.22.55.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 May 2024 22:55:10 -0700 (PDT)
Message-ID: <040b32b8-c4df-4121-bb0d-f0c6ee9e123d@gmail.com>
Date: Wed, 8 May 2024 07:55:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linaro-mm-sig] Re: [PATCH] epoll: try to be a _bit_ better about
 file lifetimes
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Simon Ser <contact@emersion.fr>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Christian Brauner <brauner@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 keescook@chromium.org, axboe@kernel.dk, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, io-uring@vger.kernel.org, jack@suse.cz,
 laura@labbott.name, linaro-mm-sig@lists.linaro.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, minhquangbui99@gmail.com,
 sumit.semwal@linaro.org,
 syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com
References: <202405031110.6F47982593@keescook>
 <20240503211129.679762-2-torvalds@linux-foundation.org>
 <20240503212428.GY2118490@ZenIV>
 <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
 <20240504-wohngebiet-restwert-6c3c94fddbdd@brauner>
 <CAHk-=wj_Fu1FkMFrjivQ=MGkwkKXZBuh0f4BEhcZHD5WCvHesw@mail.gmail.com>
 <CAHk-=wj6XL9MGCd_nUzRj6SaKeN0TsyTTZDFpGdW34R+zMZaSg@mail.gmail.com>
 <b1728d20-047c-4e28-8458-bf3206a1c97c@gmail.com>
 <ZjoKX4nmrRdevyxm@phenom.ffwll.local>
 <CAHk-=wgh5S-7sCCqXBxGcXHZDhe4U8cuaXpVTjtXLej2si2f3g@mail.gmail.com>
 <CAKMK7uGzhAHHkWj0N33NB3OXMFtNHv7=h=P-bdtYkw=Ja9kwHw@mail.gmail.com>
 <CAHk-=whFyOn4vp7+++MTOd1Y3wgVFxRoVdSuPmN1_b6q_Jjkxg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CAHk-=whFyOn4vp7+++MTOd1Y3wgVFxRoVdSuPmN1_b6q_Jjkxg@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.05.24 um 21:07 schrieb Linus Torvalds:
> On Tue, 7 May 2024 at 11:04, Daniel Vetter <daniel@ffwll.ch> wrote:
>> On Tue, May 07, 2024 at 09:46:31AM -0700, Linus Torvalds wrote:
>>
>>> I'd be perfectly ok with adding a generic "FISAME" VFS level ioctl
>>> too, if this is possibly a more common thing. and not just DRM wants
>>> it.
>>>
>>> Would something like that work for you?
>> Yes.
>>
>> Adding Simon and Pekka as two of the usual suspects for this kind of
>> stuff. Also example code (the int return value is just so that callers know
>> when kcmp isn't available, they all only care about equality):
>>
>> https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/util/os_file.c#L239
> That example thing shows that we shouldn't make it a FISAME ioctl - we
> should make it a fcntl() instead, and it would just be a companion to
> F_DUPFD.
>
> Doesn't that strike everybody as a *much* cleaner interface? I think
> F_ISDUP would work very naturally indeed with F_DUPFD.
>
> Yes? No?

Sounds absolutely sane to me.

Christian.

>
>                         Linus

