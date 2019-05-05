Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 011F914533
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 09:28:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA7D689364;
	Mon,  6 May 2019 07:28:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2047 seconds by postgrey-1.36 at gabe;
 Sun, 05 May 2019 09:19:01 UTC
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4931489385
 for <dri-devel@lists.freedesktop.org>; Sun,  5 May 2019 09:19:01 +0000 (UTC)
Received: from fsav402.sakura.ne.jp (fsav402.sakura.ne.jp [133.242.250.101])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id x458iRrd026524;
 Sun, 5 May 2019 17:44:27 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav402.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav402.sakura.ne.jp);
 Sun, 05 May 2019 17:44:27 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav402.sakura.ne.jp)
Received: from [192.168.1.8] (softbank126012062002.bbtec.net [126.12.62.2])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id x458iMmj026500
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NO);
 Sun, 5 May 2019 17:44:26 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Subject: Re: KASAN: use-after-free Read in add_uevent_var
To: syzbot <syzbot+6da9575ba2db4da91831@syzkaller.appspotmail.com>,
 syzkaller-bugs@googlegroups.com
References: <000000000000559435058813dc8d@google.com>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Message-ID: <75593427-4777-93ef-a141-5327a8afe75d@I-love.SAKURA.ne.jp>
Date: Sun, 5 May 2019 17:44:22 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <000000000000559435058813dc8d@google.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 06 May 2019 07:27:59 +0000
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
Cc: x86@kernel.org, rydberg@bitmath.org, hpa@zytor.com, wsa@the-dreams.de,
 airlied@linux.ie, dmitry.torokhov@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mingo@redhat.com, linux-input@vger.kernel.org,
 tglx@linutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBzZWVtcyB0byBiZSB0cmlnZ2VyZWQgYnkgInBrZy9yZXBvcnQ6IHNraXAgcHJpbnRrIGFu
ZCBvdGhlciBwcmludGluZyBmdW5jdGlvbnMgIiBvbiBzeXpib3Qgc2lkZS4KVGhlIGZpeCBzaG91
bGQgYmUgImtvYmplY3Q6IERvbid0IHRyaWdnZXIga29iamVjdF91ZXZlbnQoS09CSl9SRU1PVkUp
IHR3aWNlLiIgaW4gbGludXgtbmV4dC5naXQuCgojc3l6IGR1cDogS0FTQU46IHVzZS1hZnRlci1m
cmVlIFJlYWQgaW4gc3RyaW5nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
