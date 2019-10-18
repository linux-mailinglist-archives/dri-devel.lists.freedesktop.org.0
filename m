Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12561DC43D
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 13:58:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2220E6E11E;
	Fri, 18 Oct 2019 11:58:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E03A16E11E;
 Fri, 18 Oct 2019 11:58:16 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id 3so5828472wmi.3;
 Fri, 18 Oct 2019 04:58:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=6LcC7RDerqvn/wK9nKdU2yH/FQ05awOTFZpQK4ajLP0=;
 b=L/uEUMExxlCWZw7E4DG+97N9hu29i6Bzvh5WBo4fQ7/ehHxXPoOBgAYGmnOeYw7Ir2
 2Csrz0VfDchD16a8cDsZkpXPYlzvjWh6t+PARQEL89czyt0cJ94aXUFibjLzobKKGNNx
 vyR1QtOGRn9fq3FfOpmRB1W8r3MiqukmAiy5Ya1a1C+xYzhiYzh5QrIEvlkFsbXD2T46
 glR9Z56tVMB8g/LpHeYVlwNz8Gg6nEBMXfZ+BTMposxsnIqu29q0LBUbqF02164J3wig
 qmWUrYG8SvOd/z+KF8ZdC71PdKJjJ85ORCHtP915QO+VLQrodXZ5lAn/0KdH0xKFnOCU
 H37g==
X-Gm-Message-State: APjAAAVFyEtLXb0Z9osdGC2mC93kLZisGFYiUGKvFZ1+JJcRSlXEkmFa
 YEdO/fKI1QAK9H5tajQxxw+RbCGJ
X-Google-Smtp-Source: APXvYqwEem27f0mwSDbOt02EdcOUbRy5pSwMihcWgH485Ah1N8H3pFpZqqwEsuJJtRT8SGTnNsw06w==
X-Received: by 2002:a7b:c924:: with SMTP id h4mr7495939wml.46.1571399895246;
 Fri, 18 Oct 2019 04:58:15 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id 36sm6357253wrp.30.2019.10.18.04.58.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 18 Oct 2019 04:58:14 -0700 (PDT)
Subject: Re: radeon backtrace on fedora 31
To: Dave Airlie <airlied@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
References: <CAPM=9tzph8U-bMif3EghOx0wxjkosepv3Mi=HEWB9erSyMG2ow@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <6a7ff3cd-9626-013c-c365-86c7b4efcd8b@gmail.com>
Date: Fri, 18 Oct 2019 13:58:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAPM=9tzph8U-bMif3EghOx0wxjkosepv3Mi=HEWB9erSyMG2ow@mail.gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=6LcC7RDerqvn/wK9nKdU2yH/FQ05awOTFZpQK4ajLP0=;
 b=F/LRih8+atIUaKq9curIr88I6kBjz9iidMvQeQg4vU+5GPmSLaCAZ8B5Putrt2RQwS
 WXINhYP8tJcu+LWQsHVWn1rSLWQa+dkVaDYUwE1/av2vIL2HxJObPUN1FWy43J5RbNbi
 HZfA5Eu/dTcY4UzWZMIMLzmN/5doxrjwm0BfmZK+iGIkyL9klL+t058SQTMZh5fY7qG6
 rYhhued7pvxQFX3rLa31FC8+ztDmIkHsl0tX6QKNbDycjsng+/tKeQ1kx2uh7eOXLHMA
 BI3Xbp3/FVVUdmUoejdOwY6Bybo84IyKDun5hyzLSMkkXIT6yihoZdcaGEOs9uGdY8jm
 hyZw==
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
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TG9va3MgbGlrZSBqdXN0IGFub3RoZXIgcmFjZSBjb25kaXRpb24gZHVyaW5nIHN1c3BlbmQvcmVz
dW1lIHRvIG1lLgoKSXMgdGhhdCByZXByb2R1Y2libGU/CgpDaHJpc3RpYW4uCgpBbSAxOC4xMC4x
OSB1bSAwNjoyNCBzY2hyaWViIERhdmUgQWlybGllOgo+IDUuMy40LTMwMC5mYzMxLng4Nl82NAo+
Cj4gc2VlbXMgdG8gYmUgbmV3Lgo+Cj4gaHR0cHM6Ly9yZXRyYWNlLmZlZG9yYXByb2plY3Qub3Jn
L2ZhZi9yZXBvcnRzLzI3MjYxNDkvCj4KPgo+IERhdmUuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
