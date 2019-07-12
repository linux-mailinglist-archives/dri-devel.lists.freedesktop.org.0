Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0626867A72
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jul 2019 16:24:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 948DC8991E;
	Sat, 13 Jul 2019 14:24:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E4A6E312;
 Fri, 12 Jul 2019 17:57:19 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id p13so10798259wru.10;
 Fri, 12 Jul 2019 10:57:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=12w9YhMzTEceI3FF8gxwRGTZ2SJpBQ7cKMo01O/ztWg=;
 b=PrhdhOu67dnGlPsdThu3bCH5EnI0ha3wvonhvyWAQfW/XdSvD2YkgmPiwiwEJewhYo
 Lg0BLHziO1IpbVsuU3NaNdHBP9asxt9bhLRk7yNG43F2Wyw4i6TbiurfUQ5pkBbKnDtb
 8gcZEemUj69UqOuQzFdWOF8/PnghIhZ0rsMdf/YLwdcHiX0xFsJTtGrPz4t6QgjJwjzd
 tI0H8RgVE3GRZhwIWqxzo/jk1ySi0zY/tsCFslu+cMWhvNMyg54zh8H8he/EmS6hGjV6
 +i5CcwQRAW1bRr6okgVKb1QuKsFox1N9G4yg6aO86iDzLV06o8zAe3cJv/Zd04z5thlZ
 1R5w==
X-Gm-Message-State: APjAAAW5UnKeF/tUq8fOIvs0BuSB1KHPsy+hbYj0F/3bcC3QZA31l7kM
 EuEjhl80TVsvgzIhrvCZ3CE=
X-Google-Smtp-Source: APXvYqwuYdWB6sJTcg7lu3ary3cXGkPst6uJsKQ/xPttRCCOP42sFPSCTNUAC/5rbJqH417Atb6nRQ==
X-Received: by 2002:a5d:4a46:: with SMTP id v6mr12758036wrs.105.1562954237869; 
 Fri, 12 Jul 2019 10:57:17 -0700 (PDT)
Received: from archlinux-threadripper ([2a01:4f8:222:2f1b::2])
 by smtp.gmail.com with ESMTPSA id c14sm7204278wrr.56.2019.07.12.10.57.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 12 Jul 2019 10:57:17 -0700 (PDT)
Date: Fri, 12 Jul 2019 10:57:15 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] drm/amd/display: return 'NULL' instead of 'false' from
 dcn20_acquire_idle_pipe_for_layer
Message-ID: <20190712175715.GA21080@archlinux-threadripper>
References: <20190712094009.1535662-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190712094009.1535662-1-arnd@arndb.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Sat, 13 Jul 2019 14:24:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=12w9YhMzTEceI3FF8gxwRGTZ2SJpBQ7cKMo01O/ztWg=;
 b=fvbNRCUcHA5EF9w5+GiQrvMVZgK4Z0RBqPLbianwHZkzj1Wfcf6+EnVXvGLL20HLbN
 Rpt6Q2WvRtCkuXEIE13mkicHw/oNEAOvLy7KjqmEkK+FFN3Nq+RTOsBt137F5L1zJxfv
 XlRM37RIAZunhOcn6VmGJGkDf0B0ktuTTepU7L3c4hhikgOdkwWzNPwqgAPZ9ty9xRcM
 FaFD43oWmyDMbqsN8AkxuVT19TsIFc8svNEaKjSZM0VDeEjNtosfuNQZ8lL1HApsc+yi
 XiivUaq5+1DRpO+VeF24tCLdUYr9JpiXv1Wrc0w1ATm/xYbrp3NICswOxja7f931ClFI
 fDWQ==
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
Cc: clang-built-linux@googlegroups.com, Charlene Liu <charlene.liu@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Nikola Cornij <nikola.cornij@amd.com>, David Airlie <airlied@linux.ie>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Jun Lei <Jun.Lei@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMTIsIDIwMTkgYXQgMTE6Mzk6NTJBTSArMDIwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBjbGFuZyBjb21wbGFpbnMgdGhhdCAnZmFsc2UnIGlzIGEgbm90IGEgcG9pbnRlcjoK
PiAKPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjbjIwL2RjbjIw
X3Jlc291cmNlLmM6MjQyODoxMDogZXJyb3I6IGV4cHJlc3Npb24gd2hpY2ggZXZhbHVhdGVzIHRv
IHplcm8gdHJlYXRlZCBhcyBhIG51bGwgcG9pbnRlciBjb25zdGFudCBvZiB0eXBlICdzdHJ1Y3Qg
cGlwZV9jdHggKicgWy1XZXJyb3IsLVdub24tbGl0ZXJhbC1udWxsLWNvbnZlcnNpb25dCj4gICAg
ICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiAKPiBDaGFuZ2luZyBpdCB0byAnTlVMTCcgbG9v
a3MgbGlrZSB0aGUgcmlnaHQgdGhpbmcgdGhhdCB3aWxsIHNodXQgdXAKPiB0aGUgd2FybmluZyBh
bmQgbWFrZSBpdCBlYXNpZXIgdG8gcmVhZCwgd2hpbGUgbm90IGNoYW5naW5nIGJlaGF2aW9yLgo+
IAo+IEZpeGVzOiA3ZWQ0ZTYzNTJjMTYgKCJkcm0vYW1kL2Rpc3BsYXk6IEFkZCBEQ04yIEhXIFNl
cXVlbmNlciBhbmQgUmVzb3VyY2UiKQo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFy
bmRAYXJuZGIuZGU+CgpSZXZpZXdlZC1ieTogTmF0aGFuIENoYW5jZWxsb3IgPG5hdGVjaGFuY2Vs
bG9yQGdtYWlsLmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
