Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C87E71310C1
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 11:46:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82EF96E24D;
	Mon,  6 Jan 2020 10:46:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D4E26E24D
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 10:46:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: shadeslayer) with ESMTPSA id A898C28DAF2
From: Rohan Garg <rohan.garg@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: Proposal to report GPU private memory allocations with sysfs
 nodes [plain text version]
Date: Mon, 06 Jan 2020 11:46:01 +0100
Message-ID: <1931035.d46ecxlGCF@saphira>
In-Reply-To: <CAKT=dD=r46-UckK+hsZMvF0wBFqSe3bGdBa=vs2bOrarpexoPA@mail.gmail.com>
References: <CAKT=dDnhth-6giOWgym7qpLNeH=86=XhQmPcgHM2J8B_L3myRQ@mail.gmail.com>
 <2981882.gi1CFgH74X@saphira>
 <CAKT=dD=r46-UckK+hsZMvF0wBFqSe3bGdBa=vs2bOrarpexoPA@mail.gmail.com>
MIME-Version: 1.0
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
Cc: Alistair Delva <adelva@google.com>, Jerome Glisse <jglisse@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Prahlad Kilambi <prahladk@google.com>, Yiwei Zhang <zzyiwei@google.com>,
 Kenny Ho <y2kenny@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sean Paul <seanpaul@chromium.org>, Chris Forbes <chrisforbes@google.com>,
 Android Kernel Team <kernel-team@android.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yiwei

On jueves, 19 de diciembre de 2019 19:52:26 (CET) Yiwei Zhang wrote:
> Hi Rohan,
> 
> Thanks for pointing out the pids issue! Then the index would be {namespace
> + pid(in that namespace)}. I'll grab a setup and play with the driver to
> see what I can do. I know how to find an Intel or Freedreno setup, but I'd
> still like to know is there a development friendly Mali setup?
> 

You should be able to setup a Mali T860 compatible device with this guide [1].

Cheers
Rohan Garg

[1] https://panfrost.freedesktop.org/building-panfrost-mesa.html


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
