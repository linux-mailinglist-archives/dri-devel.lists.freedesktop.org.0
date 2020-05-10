Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A82ED1CD26D
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 09:18:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F5DB6E270;
	Mon, 11 May 2020 07:18:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C43898AA
 for <dri-devel@lists.freedesktop.org>; Sun, 10 May 2020 15:39:32 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id v63so3519459pfb.10
 for <dri-devel@lists.freedesktop.org>; Sun, 10 May 2020 08:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=seBRUeC3dXeweg1N46JHOrRIXAJ2J/eJ5PgpRDXu7Xc=;
 b=s4FTilbcUE8qHtABX9tC1pNRpLYSHM1TMUlKxdLHfC5Tof1lVZLrrpHEv2HJURUQAt
 gOqR0S6tdssLEU8p+wfY3407Y7n55X6ZgOiSWOYBr3SW7vwyDWMeXdxrGbFvIvTEKK8M
 FUxjaYGr2auuqB8f99EyUk5Eo7XSa1/dZc5OnGudxkdFz5beN77mjR7VSeXtEO8+G4y1
 URSuKE3HIbfwgkv/ma0LxIZF9/TwzVBUHO28l1oHJuKxu1bRlQYBtHpFvy6Qd290+Chv
 SSJwqDx3X/p7oMekjkjXbZrakW5q0inyzqjAfWSP+dub16WBR639QzqdIKuJgV4pEiDj
 MAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=seBRUeC3dXeweg1N46JHOrRIXAJ2J/eJ5PgpRDXu7Xc=;
 b=EA61+X8A1g4qgZ2/gptJSBQ4KfU/TGT1qd4VgqOqpGH+quKNCMTndYSg5ajwQOeGAF
 JeFgoZEfAG25flK4Sy2A2VtuU8iEGE+X1zIB8qvYuBm0joJSrmnWdMhmf+SL2SiWOqZL
 DeBRF/xScvoi5L2ZDVokDb1IU6+UvMxPfESDHFZltM3BlmwkEkZt9R/E9mgN91o7MhEU
 4YWZHS4SwDpJ1BE086sl7Qzdlopwoe3NaVhnjTZpcFqNOkOjPYHRBSwVLTRWTR2ybgnn
 ihIu27avd879FDFPxiXnJwovj40CwOYwuE9mpI3sRNdwi8cS0doGWs0RobVb87YeYHRR
 oxEA==
X-Gm-Message-State: AGi0PuZKknt7wDRUNvj6T6JqL4jHFOezWEM1+M/2F5t/apxaEjoOXF3f
 hvykOu8bsN04Ceyx1OEAegY=
X-Google-Smtp-Source: APiQypJCzqQ1G38MUBlHGJNY+XRYSsDfA3QS/iaiPMPTtOCZltcGYKqYDBQ/vmE4+rvfmkAA0ntZVg==
X-Received: by 2002:aa7:9432:: with SMTP id y18mr12463677pfo.82.1589125171929; 
 Sun, 10 May 2020 08:39:31 -0700 (PDT)
Received: from [192.168.1.3] (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
 by smtp.gmail.com with ESMTPSA id
 s136sm7208036pfc.29.2020.05.10.08.39.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 May 2020 08:39:31 -0700 (PDT)
Subject: Re: [PATCH 3/3] nand: brcmnand: support v2.1-v2.2 controllers
To: =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
 computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20200510151406.2527856-1-noltari@gmail.com>
 <20200510151406.2527856-3-noltari@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <e0b9365b-f22c-ac56-481b-ab21490a3409@gmail.com>
Date: Sun, 10 May 2020 08:39:29 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200510151406.2527856-3-noltari@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 11 May 2020 07:17:27 +0000
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiA1LzEwLzIwMjAgODoxNCBBTSwgw4FsdmFybyBGZXJuw6FuZGV6IFJvamFzIHdyb3RlOgo+
IFRlc3RlZCBvbiBOZXRnZWFyIERHTkQzNzAwdjIgKEJDTTYzNjIgd2l0aCB2Mi4yIGNvbnRyb2xs
ZXIpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IMOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFy
aUBnbWFpbC5jb20+CgpDYW4geW91IGZpeCBhIGNvdXBsZSBvZiB0aGluZ3MgZm9yIHlvdXIgZnV0
dXJlIHN1Ym1pc3Npb25zOgoKLSBmb3IgcGF0Y2ggY291bnQgPiAxLCBwbGVhc2UgcHJvdmlkZSBh
IGNvdmVyIGxldHRlciBpbnRyb2R1Y2luZyB5b3VyCnBhdGNoZXMKCi0gZm9yIHRoaXMgc3BlY2lm
aWMgcGF0Y2gsIHlvdSBhcmUgbWlzc2luZyBhIERldmljZSBUcmVlIGJpbmRpbmcKZG9jdW1lbnQg
dXBkYXRlIHdpdGggdGhlIG5ldyBjb21wYXRpYmxlIHN0cmluZ3MgeW91IGFyZSBhZGRpbmcKClRo
YW5rIHlvdSEKLS0gCkZsb3JpYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
