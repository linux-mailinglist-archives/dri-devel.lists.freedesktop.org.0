Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9777DB768
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 11:04:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 610BE10E27B;
	Mon, 30 Oct 2023 10:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 469AB10E27B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 10:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698660285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3jV9wsFuEisf3vb2BAnPpXdxe1/PPDMuldDZzCp400E=;
 b=AuYGFBrolrKZoSTHq2+FidQHYNqF5nmo2qu4/4pZR10CwRyfZC4G/PiOIFxD96f4Mb0Buq
 llq21gWGE9XNdPOUTV4YkW141iSA5bwkvqy6yVBq4z/SNngMjhtRqG8opD7uMC5PjQ6pBq
 cUr6IvyivDREsWQDYyxTvqSn0f/0itU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-148-QFEGcngMMDqrfuQY2_y1QA-1; Mon, 30 Oct 2023 06:04:44 -0400
X-MC-Unique: QFEGcngMMDqrfuQY2_y1QA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4092164ee4eso31116025e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 03:04:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698660283; x=1699265083;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3jV9wsFuEisf3vb2BAnPpXdxe1/PPDMuldDZzCp400E=;
 b=uRHukUyCSAFwNKcpLrhmCsh5F/DchkDRQyi+YpK1mtdnbim0OIOE+4ev6S/TNFi+NP
 Tx5nUKGdthXAscpRO0xHe1j7WVSU/4TldgQwXc8F4gkak0rZW2fRRhLG/wh2G0lo9/Nd
 L1FLqy1w+Gvj6N77FI+KtOrr2ucEqXTxCXXNaGc65fw9dDzIea1E1KNmzti3ns9gFoXh
 3+oo5N9cQzleqzu57EPyeLvZ2/hjnnnvAjg7fS5NRkbYm2lcqPSkfUqaqFxhxy2GJt9U
 n3Ww3+lv6w+NkHcWkt2ayxelnDKZoQLoCNaOGSlqeZSiZ9Dg1YVIAU8Q6rub1sDgaxaF
 i8+w==
X-Gm-Message-State: AOJu0YzhTMRBG84CQEKEyVzqKJYPahYtMxaa4Z6a6QiYAdhnpcXonm2i
 5srEDS+60VdFtcUS0CMyyrA1IP8PCFx4m4GoUqBkUNdMnui5tyg50RNJCq3NeWl+nY02Xb7Nj6+
 fTjpMSbLllxNH3wtptbL5kjW1O7Tz
X-Received: by 2002:a5d:6d08:0:b0:32d:967d:1bae with SMTP id
 e8-20020a5d6d08000000b0032d967d1baemr8378503wrq.0.1698660283175; 
 Mon, 30 Oct 2023 03:04:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyZDSUvodlaTnopLvaCTSB7TOJfDUWETWpqkH2ReIYOzMzfqhzqmVbyJj2e+ZFmRu5TTpvyw==
X-Received: by 2002:a5d:6d08:0:b0:32d:967d:1bae with SMTP id
 e8-20020a5d6d08000000b0032d967d1baemr8378481wrq.0.1698660282858; 
 Mon, 30 Oct 2023 03:04:42 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 a17-20020adfe5d1000000b003142e438e8csm7922409wrn.26.2023.10.30.03.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 03:04:42 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: ssd132x: Remove '-' before
 compatible enum
In-Reply-To: <87msw3omln.fsf@minerva.mail-host-address-is-not-set>
References: <20231020223029.1667190-1-javierm@redhat.com>
 <169801218855.747717.5658253186246322717.robh@kernel.org>
 <87y1foo1in.fsf@minerva.mail-host-address-is-not-set>
 <20231027172753.GA2834192-robh@kernel.org>
 <87msw3omln.fsf@minerva.mail-host-address-is-not-set>
Date: Mon, 30 Oct 2023 11:04:41 +0100
Message-ID: <87jzr4zarq.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Javier Martinez Canillas <javierm@redhat.com> writes:

> Rob Herring <robh@kernel.org> writes:
>
> Hello Rob,
>

[...]

>>> Pushed to drm-misc (drm-misc-next). Thanks!
>>
>> Given what introduced this is before the drm-misc-next-2023-10-19 tag, 
>> isn't it going into 6.7 and needs to be in the fixes branch? Though that 
>> doesn't exist yet for 6.7 fixes. I don't understand why that's not done 
>> as part of the last tag for a cycle. But drm-misc is special.
>>
>
> I pushed to drm-misc-next because I thought that there will be a last PR
> of drm-misc-next for 6.7, but it seems I missed it for a couple of hours
> (that is drm-misc-next-2023-10-27) :(
>
> https://lists.freedesktop.org/archives/dri-devel/2023-October/425698.html
>
> The solution now is to cherry-pick the fixes already in drm-misc-next to
> drm-misc-next-fixes, to make sure that land in 6.7. I can do that once

Cherry-picked the commit in drm-misc-next-fixes as well.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

