Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A7E5315DB
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 21:59:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B6CA10E163;
	Mon, 23 May 2022 19:59:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75C4010E163
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 19:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653335963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ddfPEJdtYL/mwU6q86zNuwkwjbjRlMAcwVwFbAWHHkc=;
 b=do6Q6sHZ2ARpOD7BMS4N4oT3FRdBWKlXEUtJo7sClu+0zvLLIWHHUlA0DAF0EzNqDZPi8K
 Ri/JI9+BQvzE78XMAXy323O4RGky3k8h8N+zI2Sjqx+LxZwd/rDpWDFQNYKYNS5NSJ+Wy6
 f24arDJaUR69IXze/MjZ/9QR7tGo+EE=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-283-1mBPsCJ2O3KnYSXApIZVOw-1; Mon, 23 May 2022 15:59:22 -0400
X-MC-Unique: 1mBPsCJ2O3KnYSXApIZVOw-1
Received: by mail-qv1-f72.google.com with SMTP id
 j2-20020a0cfd42000000b0045ad9cba5deso11736168qvs.5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 12:59:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=ddfPEJdtYL/mwU6q86zNuwkwjbjRlMAcwVwFbAWHHkc=;
 b=kPpom7fReXdh26tE4TDm29LBQDPC7ZO6WiwhKz8PS5TG+OuP48eJNko835hx+ooxim
 VjtG24vIjubPgtnRhVD7IWbQxb0GdPvegEJcEjBLOm/Lk4pqaEygVWWcnoJa+ITYzaV3
 +y/BH8ONbsF7jf/w+bOcTxwnStupo15dYm3fBJG0jpnhGIBaCEi7bG42oJLrSnIbCoaM
 pWN1ufPjEFBKArvY735CVnodvnue+lF34moLlsQwlKyQ8NF07SXVFNNBJjt9i0/c77Q4
 nj7YXwqtm2K5j1iJ/Uss1N9dJ+r4cmSQwMPZu5GpmYOtycRF2jasgofIqG7/KF2wDWnA
 BKZA==
X-Gm-Message-State: AOAM531rZqxhwKi6txne3phkKSJsiIfaC+ZMg6oLUdMN9FIkEVcnkEWk
 kLx4EEXDj+sgVpL1gniFYjyhChLLEFKUesnABZfSZcT9UlXu7kKmzLq66veNkGDmFMiDXSROUFk
 1M4mJkzFuAG/458tbyxCLVeS/o2qM
X-Received: by 2002:a0c:ea34:0:b0:456:319f:f3aa with SMTP id
 t20-20020a0cea34000000b00456319ff3aamr18650008qvp.18.1653335961836; 
 Mon, 23 May 2022 12:59:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJweet0HclEeyKfwzfrIUnDrHftXzyFLjzIinkx+VsILfcHP9e932p08gvaWx9BPXlhCjhkn8Q==
X-Received: by 2002:a0c:ea34:0:b0:456:319f:f3aa with SMTP id
 t20-20020a0cea34000000b00456319ff3aamr18649989qvp.18.1653335961438; 
 Mon, 23 May 2022 12:59:21 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 a13-20020ac84d8d000000b002f940249151sm285119qtw.73.2022.05.23.12.59.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 12:59:20 -0700 (PDT)
Message-ID: <16635cf8256db581d0318f28bb6898e2ca8cfe1c.camel@redhat.com>
Subject: Re: [Nouveau] nouveau lockdep deadlock report with 5.18-rc6
From: Lyude Paul <lyude@redhat.com>
To: Computer Enthusiastic <computer.enthusiastic@gmail.com>
Date: Mon, 23 May 2022 15:59:19 -0400
In-Reply-To: <CAHSpYy37aDAxGKR8ZbPC+C3bFxeyYqG8X1Px4h89MSxKLAak=A@mail.gmail.com>
References: <ac39455b-b85c-4cf7-8cd0-089325c9514a@redhat.com>
 <c703a49c57d77f4fcadba09a55fa926049dfe114.camel@redhat.com>
 <CAHSpYy37aDAxGKR8ZbPC+C3bFxeyYqG8X1Px4h89MSxKLAak=A@mail.gmail.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2022-05-20 at 13:46 +0200, Computer Enthusiastic wrote:
> Hello,
> 
> Il giorno mer 18 mag 2022 alle ore 19:42 Lyude Paul <lyude@redhat.com>
> ha scritto:
> > 
> > On Tue, 2022-05-17 at 13:10 +0200, Hans de Goede wrote:
> > > Hi All,
> > > I just noticed the below lockdep possible deadlock report with a 5.18-
> > > rc6
> > > kernel on a Dell Latitude E6430 laptop with the following nvidia GPU:
> > > [..]
> I hope not to be off topic in regard to kernel version, otherwise I
> apologize in advance.
> 
> I would like to report that I'm constantly observing a similar, but
> somehow different, lockdep warning (see [1]) in kernels 5.16 and 5.17
> (compiled with lockdep debugging features) every time I activate the
> Suspend To Ram (regardless if STR succeeds or not).

You may be on the right track actually, as so far my investigation has shown
that this bug definitely would have been present around those kernel versions
as well. Trying to come up with a solution for this

> 
> Thanks.
> 
> [1]
> https://gitlab.freedesktop.org/xorg/driver/xf86-video-nouveau/-/issues/547#note_1361411
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

