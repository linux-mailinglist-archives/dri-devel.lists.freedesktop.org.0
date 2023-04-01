Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAB06D2F17
	for <lists+dri-devel@lfdr.de>; Sat,  1 Apr 2023 10:35:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF54410E066;
	Sat,  1 Apr 2023 08:35:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7528B10E066
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Apr 2023 08:35:43 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id bx42so2857424oib.6
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Apr 2023 01:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680338142;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1VwVQomXd5Zv0oc2cOzA2dNy1IDIN7zen19ti9Y4+h0=;
 b=GKwwshigjYzgT5A6DHoE7vuuJiHt2dyOgEASzCH2cCRjnfunba4bjWRQA+VMGSgikA
 V6gn7B3+Ko4JgRsa2wJV9iNh3BcB4kNxOzQKuLPjM8Zm0QmwqSywpVu8gKIeY8QoQgpi
 VCNd8S8Sht01KQNuneIFxw14tUN8JdNZeHQQOES9KED0nY8dp0vby3FQe/FlQHSC7KB3
 +WIOj213RflIqrOAniBrzHxU8A45XW9s0zsYj1eCZ2MtvoX3m+eTnAX1TR8Zf9h+EJlV
 3J/wG/M6heQOjQ4YLW85RVpHRAJFIfPd8huyBMoFhS3InV5cAswsWygJOLAF9SY2zPZ8
 sgIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680338142;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1VwVQomXd5Zv0oc2cOzA2dNy1IDIN7zen19ti9Y4+h0=;
 b=Dk+6/nUrXBvMT43HpJHSjGhjl//7O6UoLF2mzTpSMKN8aKtDGQ8ez4Tu0jq+6unt5J
 0VIc1BnMQCMV+Z5/3nsaANTP/iKGdgFRX6CJHhFjxVqAbY2OxJdpMxhIGe7ho/A1PNBu
 grRaFhiQ7dCDX2pp+leTpEon58/b8GtLViBcQOvUVgiyPTMEVgazpbu0qfgdF5TXUmKp
 d0Eas+1A/+ipLYF4qQySwPRiWgO5Efd7NOqL/h1UUFTN/JoSW1xxflvoEDUj8kg+GEym
 AI0lRVveboexltGM6uYWWeCwCbJQCGXbPiaYLUOrkZkdjKlSNSZDYrSEs7aFp39/kwPI
 bawA==
X-Gm-Message-State: AO0yUKUoj6TDGxqWXjgMlIcPIQY5aSZWWGYwrjyTF3oU6XUKcAqeAE4a
 6J1NTllseEAEInSnwFXNMN9jxn1nIN7h0f0C/00=
X-Google-Smtp-Source: AK7set8KjM/fud01LYEdEw4o75u38YsCKt6Kspqxm62B4+H55PxMjW5idzgSivTrzffGLyoXQLXC/bnUz/eIf6NwUu4=
X-Received: by 2002:a05:6808:8c:b0:386:b6a7:c093 with SMTP id
 s12-20020a056808008c00b00386b6a7c093mr8861476oic.6.1680338142207; Sat, 01 Apr
 2023 01:35:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200424222740.16259-1-afd@ti.com>
 <CAL_Jsq+4mf6QHX27knoHTXA4vnsC3swuvAH7zK1DpyaV-p_qbw@mail.gmail.com>
 <f46c097a-b2a6-6368-a8a4-e30995a54d17@ti.com>
In-Reply-To: <f46c097a-b2a6-6368-a8a4-e30995a54d17@ti.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Sat, 1 Apr 2023 10:35:30 +0200
Message-ID: <CAH9NwWeZnDEkundm98=KL6xB9bVO3nOkk48xMF-eQnztP4DD4g@mail.gmail.com>
Subject: Re: [PATCH] misc: sram: Add dma-heap-export reserved SRAM area type
To: "Andrew F. Davis" <afd@ti.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org,
 Rob Herring <robh+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrew

>
>
> Okay, will split for v2.
>
>

Was there a follow-up v2 of this patchset? AFAICT this series did not
make it into the mainline kernel.
Do you have any plans to work on it? If not I would like to help out
as we have a use case where we want to
use a dma-buf sram exporter.


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
