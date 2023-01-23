Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 285946780CD
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 17:04:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D20810E4E8;
	Mon, 23 Jan 2023 16:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender-of-o51.zoho.in (sender-of-o51.zoho.in [103.117.158.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B0F10E4C6
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 15:15:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1674486907; cv=none; d=zohomail.in; s=zohoarc; 
 b=N0iO0BlGHAEe0XRXpskAG/l4htT7wNplyqXBiB/Qh3sQtGWdo993U35atR0YgTNiBJvWXkwXfwKBKvfrL5E3ZviFFmNHo/aa9lCmKIEtTTsIxjnExQrIQlH03BlDIm4EHeV4P3lYehp8N9cB+4E8dQqGe6du9y29/wuAOvIXzns=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1674486907;
 h=Content-Type:Content-Transfer-Encoding:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=2flCe/64sR7JNpV5Kc7bVFWr5wIaHCE6zPixB1DvTQ8=; 
 b=fwww8noQwiz4Le1bemc1BKc7dvw3sorMU2BJHOM9mfdWXUOSrnvJ1doNXu/NA1A+PvC/ow4T7+yfKPsuh4O2Q0vAss0skGSBcrKJjtUkT9WjrAPRWGQoOfNbXd1trVlRDEHhTIHJvAAmRvkhrkUi1WhcOWMoJ4HYRLpDhoBgpwo=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=vaartaa@siddh.me;
 dmarc=pass header.from=<vaartaa@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1674486907; 
 s=zmail; d=siddh.me; i=vaartaa@siddh.me;
 h=Date:Date:From:From:To:To:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
 bh=2flCe/64sR7JNpV5Kc7bVFWr5wIaHCE6zPixB1DvTQ8=;
 b=oqWsBVtS6QD0FTBtJjyFHehPKt4tYsmkEr+uViExvb0gbvAJl9JRjdIIV3GapNaD
 FVujP4PnA55gOkWepkevyh9jxkILUfkftZ1EEf0yRyV6R8f/a6tbxN5Fttg/GrT00y0
 zt5LYH+406rGGo9XFLE0fZ+Hbb22JH/s9ELXX1Yc=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1674486896135629.085955431609;
 Mon, 23 Jan 2023 20:44:56 +0530 (IST)
Date: Mon, 23 Jan 2023 20:44:56 +0530
From: Siddh Raman Pant <vaartaa@siddh.me>
To: "evoc" <evoc@foundation.x.org>,
 "dri-devel" <dri-devel@lists.freedesktop.org>
Message-ID: <185df3255fa.618e0cab108940.1914310247153833092@siddh.me>
In-Reply-To: <185d60286fc.132d37c8232094.4969738854762246851@siddh.me>
References: <185d60286fc.132d37c8232094.4969738854762246851@siddh.me>
Subject: Re: [RFC] Proposal for X.Org EVoC
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-Mailman-Approved-At: Mon, 23 Jan 2023 16:04:33 +0000
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

On Sun, 22 Jan 2023 at 01:56:07 +0530, Siddh Raman Pant wrote:
> Hello,
> 
> I want to participate in X.Org EVoC as I am looking to learn and
> contribute more to the Linux kernel.
> 
> I have made a draft proposal at https://gitlab.freedesktop.org/-/snippets/7366.

Seems like my gitlab.fd.o account was auto-deleted due to lack of
repo-based activity, so this snippet link returns 404.

I uploaded the same on GitHub, please find it here:
https://gist.github.com/siddhpant/3f49f6acba377175832aa054df4830fe

Thanks,
Siddh

> Please take a look at it and let me know your thoughts.
> 
> I am also looking for a mentor. I had tried earlier to contact some
> people asking what & how regarding EVoC, but they were busy. I also
> felt I should have communicated better & structured some information.
> With this email, I'm attempting to do the same.
> 
> Please let me know if the proposal needs changes, or if it is full of
> nonsense, and/or I need to improve more.
> 
> Thanks,
> Siddh
