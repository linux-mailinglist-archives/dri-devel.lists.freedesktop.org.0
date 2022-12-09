Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB44C648DE4
	for <lists+dri-devel@lfdr.de>; Sat, 10 Dec 2022 10:21:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 504AA10E0A8;
	Sat, 10 Dec 2022 09:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 908 seconds by postgrey-1.36 at gabe;
 Fri, 09 Dec 2022 11:06:36 UTC
Received: from sender-of-o50.zoho.in (sender-of-o50.zoho.in [103.117.158.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 598FC10E51C
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 11:06:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1670583082; cv=none; d=zohomail.in; s=zohoarc; 
 b=U5CMJ7vXtiHxe8gnQAdT3haARLAMYfnF3zixV7ddlXZnbZ/VEQz/PcwsPWGZA/0WvdhrkmhSmHgSD9M1Kdk82T/R7r2PUEO+UKCUXgwutX7OtlvIySqB5Ysdx6jGY36RGXYNbA1sjYck99OMQVt7rd3VbQQRz67Si+hnXT5HUTs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1670583082;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=n2OIW6Zki7hh9PQlGDE45HtL8GBarX6yLnXDU1h5u3g=; 
 b=YB7jcr/i+pxfCyYsD8io2t1p86RbwrjguY9BTtCTZmB3nPD4Oj/dWOFGQD8t6qdWaROfAVisq35cOzLuvO0UQjmqr1JBfIEEPxR8y6yzxLZQ/d5YVFhkA0N0R3K6aCPB26B63GAAC5xK7nX0hRdxTEr2xokXvWMnxOHp63TVSss=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1670583082; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:Subject:Subject:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=n2OIW6Zki7hh9PQlGDE45HtL8GBarX6yLnXDU1h5u3g=;
 b=TpsbXgPHROlcGN79JcKP8KAYVhOgMipzrZmb1RJUmrxQ7T2hCh+f5pRLXn/7PFQv
 IIYMHT1CYAjUs57ZQbnfTXp3a8YVDeVbkDF450R4j979Om80/gbdpdWuLaw9uXgDRyP
 fQpV9tojrTpi+b1x3sf7ipjlvqNVQOyMIcs240to=
Received: from [192.168.1.9] (110.226.31.37 [110.226.31.37]) by mx.zoho.in
 with SMTPS id 1670583081876813.6343775119691;
 Fri, 9 Dec 2022 16:21:21 +0530 (IST)
Message-ID: <524d919d-0197-2a81-9165-d0d6feb607fe@siddh.me>
Date: Fri, 9 Dec 2022 16:21:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
To: syzbot+6f7fe2dbc479dca0ed17@syzkaller.appspotmail.com
References: <000000000000cad06305d2ea0750@google.com>
Subject: Re: [syzbot] WARNING in drm_wait_one_vblank
Content-Language: en-US, en-GB, hi-IN
From: Siddh Raman Pant <code@siddh.me>
In-Reply-To: <000000000000cad06305d2ea0750@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-Mailman-Approved-At: Sat, 10 Dec 2022 09:20:55 +0000
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
Cc: syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Test the reproducer on latest.

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
