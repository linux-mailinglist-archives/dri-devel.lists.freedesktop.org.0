Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D425B142653
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 09:58:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83E516E863;
	Mon, 20 Jan 2020 08:58:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0D446E136
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jan 2020 20:27:50 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id q6so25727381wro.9
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jan 2020 12:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition;
 bh=yYujZK8rtLhI7kdUVo/GFiBrqxNVwejOF4ZC9pG95iY=;
 b=APsT5oLJxy5g7CxZ8nVK+F/Q2F/UsgbzHFjsD3mbyhcs8cKGgOmUsISdlSdU3PA6gF
 rcn+BJrG03T+75ULEIbnxTxUN7SAGFH1lkaDE5mksNg7yIXRKgwxoYXuc4bm7qh/ccj+
 1EZ56ktPlOqzQ2skRqipU2Vu7IAXrUgm1i/AfiaPbAtydtiop6ULBNh4LJl0UEDmIl+a
 b6WruB9gmL+t/1iAmgnwVXDWrhl6gH1xXAHqasxLj+KYsv7Z324olsxX2O+9Zf14P3qJ
 lH2LfY5DA6AhFBofOTtnw5BmfkLgf+sza+BRzMS30EtLPOz2VTEEuwt0A1GxZv64SmTd
 dW+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition;
 bh=yYujZK8rtLhI7kdUVo/GFiBrqxNVwejOF4ZC9pG95iY=;
 b=dcin7jVxLJdj/ZqK5qa8Y8rwM7asFsE/YDrhqBp5mKDagJuBY3ZMy0SLExyERgZ9Xz
 wVjCOk/j66KMM2VDxtMuP74l3HQ1K4/Ts/s/XYE03RSco/21DuPZuDRNDjFg5P2yZ4ZK
 fpZ89TyAm4AutTwnJKtpGmXl+kTt8a3X/5FbBJ5cVYze5YWqdl0Lmu/RWHZcCVHOmWJd
 ZUVIxu8EbqkRYOkiE25gS0GH7tQ6kPAM2xY7MKz05318eaCT/8vvZPRtYGo5JG5BJr1n
 38d6CQ3Mbg3clA3zcyU2ttA5UsG4HW3LgXADf0QwQDv08ksz/rPWkJgEdP9gWiwfX2d9
 0nbQ==
X-Gm-Message-State: APjAAAUq1aY3pFK1AeeU46dymyETMSji7qij2p0hlR4q1cV3nCzlanSZ
 KDUWXwU/Kcj4Y2GBzAEWePqUbztH
X-Google-Smtp-Source: APXvYqyNsLHUh+vJa1qQGNJikrwGNYHYF6rjNYw2bmAHa7HVzw9VqWVi+GsSTfXjsBIjOBhxY7ZqmA==
X-Received: by 2002:a5d:5283:: with SMTP id c3mr10363840wrv.148.1579379269036; 
 Sat, 18 Jan 2020 12:27:49 -0800 (PST)
Received: from thinkpad.localdomain ([89.238.137.39])
 by smtp.gmail.com with ESMTPSA id x11sm5652690wmg.46.2020.01.18.12.27.47
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jan 2020 12:27:48 -0800 (PST)
Date: Sat, 18 Jan 2020 20:28:42 +0000
From: Piper Fowler-Wright <piperfw@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: drm/i915 GPU hang
Message-ID: <20200118202842.3pl5jcvl2bjxlgs3@thinkpad.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Approved-At: Mon, 20 Jan 2020 08:58:36 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I have recently (since the New Year) been experiencing regular GPU hangs
which typically render the system unusable. 

During the hangs the kernel buffer is filled with messages of the form

[ 8269.599926] [drm:gen8_reset_engines [i915]] *ERROR* rcs0 reset request timed out: {request: 00000001, RESET_CTL: 00000001}
[ 8269.600022] i915 0000:00:02.0: Resetting chip for hang on rcs0
[ 8269.601827] [drm:gen8_reset_engines [i915]] *ERROR* rcs0 reset request timed out: {request: 00000001, RESET_CTL: 00000001}
[ 8269.602595] [drm:gen8_reset_engines [i915]] *ERROR* rcs0 reset request timed out: {request: 00000001, RESET_CTL: 00000001}
[ 8277.705805] i915 0000:00:02.0: Resetting rcs0 for hang on rcs0

etc.

Most recently the following message was displayed

[12796.753277] i915 0000:00:02.0: GPU HANG: ecode 9:1:0x00000000, hang on rcs0
[12796.753281] GPU hangs can indicate a bug anywhere in the entire gfx stack, including userspace.
[12796.753282] Please file a _new_ bug report on bugs.freedesktop.org against DRI -> DRM/Intel
[12796.753283] drm/i915 developers can then reassign to the right component if it's not a kernel issue.
[12796.753285] The GPU crash dump is required to analyze GPU hangs, so please always attach it.
[12796.753286] GPU crash dump saved to /sys/class/drm/card0/error
[12796.753304] i915 0000:00:02.0: Resetting rcs0 for hang on rcs0

Unfortunately, the /sys/class/drm/card0/error file contained only "No error
state collected". 

bugs.freedesktop.org is no longer in operation so I decided to post here. Please
redirect me to the correct list if this is one is not appropriate.

My system info is:
CPU/GPU: Intel i5-8250U/Intel UHD Graphics 620
Kernel: 5.4.12-arch1-1
Video Driver: xf86-video-intel 1:2.99.917+899+gf66d3954-1 (mesa 19.3.2-2)

Let me know if any other information may be helpful.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
