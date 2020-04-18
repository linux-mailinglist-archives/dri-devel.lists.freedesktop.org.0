Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7671AEC07
	for <lists+dri-devel@lfdr.de>; Sat, 18 Apr 2020 13:13:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E43BB6E423;
	Sat, 18 Apr 2020 11:13:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3ABA6E423;
 Sat, 18 Apr 2020 11:13:13 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id u11so5371231iow.4;
 Sat, 18 Apr 2020 04:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AKMSMR1+WcKScxmI8ZwhCHzKARdDK8BPgfIVeOPP3NQ=;
 b=NxShl3oz6Q30kTK3NvrVwK2Aeje3puDPaUPaSuFIf+Tul0fzP52Uj2eNBDCNhmJ1Bf
 P4t9J8zInqnHnw9rRB8zBIRWk0Ehte+z33Iu3W1o6PLQD4ErCsfrY0upRyXgdRityTuW
 nUP/WIIDLdSfQdZsSqKpu183FPXq7LATHzX5XGzZWHtRednZ9l8XKeXHWyXPcDbndZ9Y
 xbQnfydroKws/JpGJdyt9f/7Jw4iPai1p7MWrXH2LpimAMYPdT5Ul2xUtW1MTKMVvF1W
 UiQFx5voHiArwoqz7yVkD/Gq6VSZxbz0mT6588bzvH+ev2ealVPGere0mh+zVSQgoebZ
 YgZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AKMSMR1+WcKScxmI8ZwhCHzKARdDK8BPgfIVeOPP3NQ=;
 b=Qjw+fiBVhZUSPFZYZ6gsRmy06Usod1JbXKZiDupI73LFGpefUckBZpBuoDGQxsKDo0
 EMLvdou03pndMZvXUwTv8eGoLOrNA9YIiYqzO2iKQVPKROG8L4vEHdqspysgr6691WSV
 LMDWj0T5R2YFDDaCugXrXnLOV3Eq7On8B+Q1ZE+tuaadrcCSxNBAmtOo5HFERgg7u3oi
 nODMaUsZO/nmkYpV7nEpWZ6gTzaK7tYrlt9VQiaBy1WBB9pCTnsq7NpWVR2Ng3beRAcB
 KgbuTNqAWAXj8UpJOk3936nL1u1gMHZx2ERHmQ6OromqujEHVyvvzwTHrEIyx86gO4L6
 Z1Qg==
X-Gm-Message-State: AGi0Puai+tFD3oCvxGDyfA0XgH2QkToxQt3IUZ515Iptu0y8l2C65i+M
 zmsimBoL/ME3j4KsHnxfZ3SAUta0Rmq3vZxrsl7SUKuCwbZlJg==
X-Google-Smtp-Source: APiQypI6ME07ywIOTKFOnfStd4PcGNqAgLq4WzfXLmCV8qaP5LE3hKSXM4O9rfAAiWR/WBkZhkh/dVK66rSScDxP47Q=
X-Received: by 2002:a02:a68e:: with SMTP id j14mr7422107jam.86.1587208392947; 
 Sat, 18 Apr 2020 04:13:12 -0700 (PDT)
MIME-Version: 1.0
References: <CABXGCsN=SNp7Ub3KHmsGrg+5R1g13HMea2+Jw+hTer3g74q21Q@mail.gmail.com>
 <4a9ae285-f126-c83b-b55f-36bd7a4403a0@gmail.com>
In-Reply-To: <4a9ae285-f126-c83b-b55f-36bd7a4403a0@gmail.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Sat, 18 Apr 2020 16:13:02 +0500
Message-ID: <CABXGCsNSni7cjufva_n-VZQ4HKY2osBL4JB2kk_z7Pzv2u10MQ@mail.gmail.com>
Subject: Re: BUG: kernel NULL pointer dereference, address: 0000000000000026
 after switching to 5.7 kernel
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: "Russell, Kent" <Kent.Russell@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAxMSBBcHIgMjAyMCBhdCAxNDo1NiwgQ2hyaXN0aWFuIEvDtm5pZwo8Y2tvZW5pZy5s
ZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gWWVhaCwgdGhhdCBpcyBhIGtub3du
IGlzc3VlLgo+Cj4gWW91IGNvdWxkIHRyeSB0aGUgYXR0YWNoZWQgcGF0Y2gsIGJ1dCBwbGVhc2Ug
YmUgYXdhcmUgdGhhdCBpdCBpcyBub3QKPiBldmVuIGNvbXBpbGUgdGVzdGVkIGJlY2F1c2Ugb2Yg
dGhlIEVhc3RlciBob2xpZGF5cyBoZXJlLgo+CgpMb29rcyBnb29kIHRvIG1lLCBzbyBpdCdzIHBp
dHkgdGhhdCB0aGlzIHBhdGNoIGRpZCBub3QgZXhpc3QgaW4gdGhlCnB1bGwgcmVxdWVzdCBodHRw
czovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExNDkyMDgzLwoKLS0KQmVzdCBSZWdhcmRz
LApNaWtlIEdhdnJpbG92LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
