Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB7F2C7C42
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 02:04:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E856E40B;
	Mon, 30 Nov 2020 01:03:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2649 seconds by postgrey-1.36 at gabe;
 Sun, 29 Nov 2020 11:13:35 UTC
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B2F76E1A2
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Nov 2020 11:13:34 +0000 (UTC)
Received: from fsav403.sakura.ne.jp (fsav403.sakura.ne.jp [133.242.250.102])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 0ATAS9m8054657;
 Sun, 29 Nov 2020 19:28:10 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav403.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav403.sakura.ne.jp);
 Sun, 29 Nov 2020 19:28:09 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav403.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 0ATAS9Ol054651
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Sun, 29 Nov 2020 19:28:09 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [PATCH v2 02/28] video: fbcon: Fix warnings by using pr_debug()
 in fbcon
To: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>, 
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-3-sam@ravnborg.org>
 <9fbdaff8-18af-223d-6cec-4b44aeb94fec@suse.de>
From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <fe2a56cd-10bd-962c-4f65-96c23a78cdd7@i-love.sakura.ne.jp>
Date: Sun, 29 Nov 2020 19:28:08 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <9fbdaff8-18af-223d-6cec-4b44aeb94fec@suse.de>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 30 Nov 2020 01:02:59 +0000
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
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Evgeny Novikov <novikov@ispras.ru>,
 Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>, Aditya Pakki <pakki001@umn.edu>,
 Xiaofei Tan <tanxiaofei@huawei.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Alex Dewar <alex.dewar90@gmail.com>, Jason Yan <yanaijie@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Qilong Zhang <zhangqilong3@huawei.com>, Randy Dunlap <rdunlap@infradead.org>,
 Gustavo Silva <gustavoars@kernel.org>, Peter Rosin <peda@axentia.se>,
 George Kennedy <george.kennedy@oracle.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>, Jingoo Han <jingoohan1@gmail.com>,
 Joe Perches <joe@perches.com>, Peilin Ye <yepeilin.cs@gmail.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC8xMS8yOSAxOTowMywgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6Cj4gQW0gMjguMTEu
MjAgdW0gMjM6NDAgc2NocmllYiBTYW0gUmF2bmJvcmc6Cj4+IFJlcGxhY2luZyBEUFJJTlRLKCkg
c3RhdGVtZW50cyB3aXRoIHByX2RlYnVnIGZpeGVzIHNldCBidXQgbm90IHVzZWQKPj4gd2Fybmlu
Z3MuwqAgQW5kIG1vdmVzIHRvIGEgbW9yZSBzdGFuZGFyZCBsb2dnaW5nIHNldHVwIGF0IHRoZSBz
YW1lIHRpbWUuCj4gCj4gSSBndWVzcyB0aGlzIHdhcyBhZGRlZCBmb3IgcXVpY2sgZGVidWdnaW5n
IGR1cmluZyBkZXZlbG9wbWVudC4gQW55d2F5LCBJIG5ldmVyIGxpa2VkIHRoZXNlIGtpbmRzIG9m
IGhhY2tzLgo+IAo+IEFja2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3Vz
ZS5kZT4KPiAKCkJ1dCByZXBsYWNpbmcgcHJpbnRrKEtFUk5fREVCVUcpIHdpdGggcHJfZGVidWco
KSBwcmV2ZW50cyBfX2Z1bmNfXyBmcm9tIGJlaW5nIHByaW50ZWQKd2hlbiBGQkNPTkRFQlVHIGlz
IGRlZmluZWQuIElzIHN1Y2ggY2hhbmdlIHdoYXQgdGhlIGF1dGhvciBvZiB0aGlzIG1vZHVsZSBl
eHBlY3RzPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
