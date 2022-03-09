Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B2F4D2D13
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 11:24:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59FF310E3DC;
	Wed,  9 Mar 2022 10:24:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8FE610E3DC;
 Wed,  9 Mar 2022 10:24:05 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id qt6so3822035ejb.11;
 Wed, 09 Mar 2022 02:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=LuqkKDU8p4/5l+NrIw2zkoI1YEZeOAu3np4mrHPH9k0=;
 b=UQbYBH82jSDnOcvbtnWwe/0XPoUXg82Z9OVq8pEaaqerglEbR3DO0m9b5iKFwJVENL
 6XH4uzpV5PhxoHxUpr/AoLuXKK5Cw4SwGwFHwYZEhRfOfjznioNHeS/sZcGFXJdCSygk
 SlVqRi0yjpiAtFmn/KiD/NDrtJW95tGzcDPlBhsyL5O64qdjxPgJexHnKl3/v2sWLYtO
 7+rnOGNPu8VWOAOj1Vb07biBb8JwwVmEka3pCT6uDVqqAv5TORMpxJVX2XTL6Qd4EAmN
 ZuCUBShyYMHDi/SrlUn0vCfcAiIgNyzlfs2bTbM9wUeOst6Z+xmlJ9aFSy+RIa8w99AQ
 EwSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LuqkKDU8p4/5l+NrIw2zkoI1YEZeOAu3np4mrHPH9k0=;
 b=u208HgDxftxx0krIqHoBMeLhmMiOiL0LU8lYdjX4H0Cr/9VDtyTTUUl46FGt2OXJzP
 KrAbia7mGp4Yz0v5ZF3kvtwSyqYxKLkJkwZcFi8iaVMkGJQP1OuDtMdQxALa8oHV93rl
 Fqc0pZUBwfQcA1Cit1avpIGcqGbe0kl9XuHrjQhJqO3tgkxML9704SKgJVQAWkrGKkV8
 rxP7l4G0/or57fDIWGcHYUAFq+4T6Yg12bCBpa4xprO5sAi1nkejJrqr65qn37pBdtjO
 TEPIYywuGOeWyg45YP4nam9D48CNfD3BhvaWpEl009qEqRm00WsbE9KVXoGzE9tw/jrT
 XZhw==
X-Gm-Message-State: AOAM530WqNJqRnZDYMeL4lWANzdLf3sjMBOkpgRbHQAVDVqOllVUPsjw
 ewm2pRujRlQ/QHPOEOu4C5U=
X-Google-Smtp-Source: ABdhPJwyqACs6VJEglGsjvHndh8A3gAnJW9URsqVw8juQHpatmLRXX685qGQ6IDOrzIjM4BoL3OxGQ==
X-Received: by 2002:a17:907:2d90:b0:6d8:9fc9:ac36 with SMTP id
 gt16-20020a1709072d9000b006d89fc9ac36mr17073363ejc.28.1646821443997; 
 Wed, 09 Mar 2022 02:24:03 -0800 (PST)
Received: from ?IPV6:2a02:908:1252:fb60:97ec:d1db:f85a:1e04?
 ([2a02:908:1252:fb60:97ec:d1db:f85a:1e04])
 by smtp.gmail.com with ESMTPSA id
 zk1-20020a17090733c100b006dab4a41df8sm553479ejb.111.2022.03.09.02.24.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 02:24:03 -0800 (PST)
Message-ID: <1e2ad919-e336-cf8f-c675-0ddd62796a0f@gmail.com>
Date: Wed, 9 Mar 2022 11:24:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20220308180403.75566-1-contactshashanksharma@gmail.com>
 <589bca3a-6f44-39bf-1eb5-1cb2628e4fee@amd.com>
 <DQGKSkEjxg-p9oBYX3hMa6fmY3Am2mAT4KBSQL_qsLGK0m85wehKp54s1IbobLSc5-FGbY67HrlWfQYO876bGgeObzY5eJF5UXJ1BktPilA=@emersion.fr>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <DQGKSkEjxg-p9oBYX3hMa6fmY3Am2mAT4KBSQL_qsLGK0m85wehKp54s1IbobLSc5-FGbY67HrlWfQYO876bGgeObzY5eJF5UXJ1BktPilA=@emersion.fr>
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
Cc: Shashank Sharma <shashank.sharma@amd.com>,
 Amaranath Somalapuram <amaranath.somalapuram@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alexandar Deucher <alexander.deucher@amd.com>,
 Shashank Sharma <contactshashanksharma@gmail.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 09.03.22 um 11:10 schrieb Simon Ser:
> On Wednesday, March 9th, 2022 at 10:56, Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com> wrote:
>
>> Would it be possible to include the app parameters as well?
> Can all processes read sysfs events?

No, but application parameters are usually not secret.

> There might be security implications here. The app parameters might
> contain sensitive information, like passwords or tokens.

It's a well known security vulnerably to provide password etc.. as 
application parameter since everybody can read them through procfs.

> Can't the uevent receiver query the kernel to get that info from the
> PID?

I'm leaning also towards just providing the PID and not the application 
name. The information should be as short as possible.

Regards,
Christian.
