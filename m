Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B813E48C050
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 09:52:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B318C112E42;
	Wed, 12 Jan 2022 08:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9437211AEEB
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 09:51:18 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id x7so42206087lfu.8
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 01:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=y1r7qcOoxLZVNoNmodA97gVRJbmjeeiduf9oclYMPMY=;
 b=GkNRzS9JnRVDO4SJtw3qITFR6O6XE/EmPXJo7mF4L6zmtmlGM7Kf5tG+e7zmxm5qjM
 oJ6osP1n0iVoKWDDXGO6iKPJS6Md/eY3NT685gXL8tehou/HD2k5FMiM9IDVXFIveK4W
 0UhKnKJCJVc6MgQoIWwORD+ovxepjTg4axf95PaziB6rU14UnhghLkpa2Fzfc7FoN/yV
 pKe/aYi2XxwE/NJmVxh9BvmjLZ5uLPn+hdetoC6v2zj+qHiDx0ZN8VamWq+tx9ZPKNEC
 R4zWSWLIDbCJVnTkKZtDVp+pttHIZd64NdLKcBL8eDIYYLRxKxjBoEDib76Zbdtt6SYX
 gAWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=y1r7qcOoxLZVNoNmodA97gVRJbmjeeiduf9oclYMPMY=;
 b=r6LvbunjGWmdNGfDFvPnT3Zis/tMhHQ4eA5pIL2fD8BWe878OYq5hCWPRaWYXWtwWd
 U2xbOEpO0m0H3933PvvOgLTlBaH0kxsbnD3rf2e1atTU8GlYapKCaWJsM1XpbA+nbaao
 EnNnlA+Oh4OVUhRORuJiKMnlgq6gnL1EpxgO7jlCF2DBJmp/jDWGKROwM1dZ5bfurFEV
 Uqhsik5PiLmn2/S4HiFuk85BRqh5xWO0i/DXmxxdLMhJAQ2/fY5Yd3h3Woa1YIENe8QD
 HcKZNjXF7H5fa+LGupC20qi6vYbA6L4iPxSLqDivGLCDI7c9AqD3aFpHSSq0qQC5JlmI
 jSow==
X-Gm-Message-State: AOAM531aopXAefxysuChwU8V0hNgGcshlebRsBqP+WfWryYN5RVvEKGI
 B8VF9dEBNCBay+AOwsBmc4yZ1w==
X-Google-Smtp-Source: ABdhPJx9+x3Kh4QAiAZKohB0Ymdo5sIsdfS73XLp2isfah2UyRZmm/Bmrm23jXAq5hL/eYGESPsaQw==
X-Received: by 2002:a2e:2e18:: with SMTP id u24mr32442126lju.492.1641808277016; 
 Mon, 10 Jan 2022 01:51:17 -0800 (PST)
Received: from [192.168.112.17] (nikaet.starlink.ru. [94.141.168.29])
 by smtp.gmail.com with ESMTPSA id z13sm871888lfu.255.2022.01.10.01.51.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 01:51:16 -0800 (PST)
Message-ID: <fbabf712-ea2a-5bd4-56d4-70cf4d7f72f6@cogentembedded.com>
Date: Mon, 10 Jan 2022 12:51:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a77961: Add lvds0 device node
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20211224052309.1997096-1-nikita.yoush@cogentembedded.com>
 <20211224052309.1997096-3-nikita.yoush@cogentembedded.com>
 <CAMuHMdVHMzZipXaUE_SrkHtj6edZATefC908P1ngLrnOry8KCA@mail.gmail.com>
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
In-Reply-To: <CAMuHMdVHMzZipXaUE_SrkHtj6edZATefC908P1ngLrnOry8KCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 12 Jan 2022 08:51:42 +0000
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

> i.e. will queue in renesas-devel for v5.18.

that is, for current + 2 ?
