Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3E92F0A03
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jan 2021 23:26:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB87689AE6;
	Sun, 10 Jan 2021 22:26:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A9BE89ACC;
 Sun, 10 Jan 2021 22:26:30 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id v67so6890483lfa.0;
 Sun, 10 Jan 2021 14:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=zUDP90lO0cgtaoa+C+R0TXIrpE8ZSeZJnX7l4//TRtE=;
 b=ueOqPPKcPRT/fo3qweKh/vSrq8I/RFOWCmYettzMvTlMMQVzfTw1WMsauYdA75eWZN
 v4jwr+IrRKLgHKKSiuHge7QsCq5FeZB50iERo/cTt99icOjNG9Obwgap0zFdI++ycABm
 oURr15CLuolJV8M5mpRE2JQ/vUrp545yik5hFv7FYWDTfLsynWTp8Gnv7Q6ViiKcHJup
 DTvDG/GVb5ZuirAOfL3BlTpOcTXeawY/SpIvBER4tQLtzC2KMb1O0cDXKr731aNQPGf8
 nLxbiC6d4ns3li1MA470CFRN3qfv2Ip7NZbp81qCzkCzXwTigLto5+67T+KXKOfrdmTS
 yBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=zUDP90lO0cgtaoa+C+R0TXIrpE8ZSeZJnX7l4//TRtE=;
 b=BO27U4OKXJyWbjdwQyWT+gMXRqd6AaowDj72XwZNiXDUBv0J4Coz6mLExRyHWYRkkL
 z8HrXAwiNrQrYfnir9Q1ROAkD9n1wfErxMiQA0kyi59DQUiKRN1zrGmSCvuw2iIS9Nq7
 j5sYWwrkH/arxeAHwPKEVLFFbLFLt06M0eLDEQmnPmdtqCTQEZNnvYG0gUBYhWE3PSSm
 xU+DRzrIQk9cdoU4abG5qMMVtNBPkJW5zL/MqvV3ewSIrmRSsihqyLH2V0wObGr6Bxip
 uQJBT8nOrj6SuO1YiW9OF62PnhGc9RtEHr6P/keac+OpNjroxiJclfJge8x5sjtjMtNo
 D//g==
X-Gm-Message-State: AOAM533B4Mnyr3His+FXlOf7gOlWV5bZwDtcra3Jm/Ty2hmFmTjxEm/3
 CazFhFQ6DMgvTwsEC4AogKKzDK7QydAU4Io8EOCsNro/5VBFrg==
X-Google-Smtp-Source: ABdhPJyRWs1QcD4OkIBMQ8qIEoN6VsFRbmL/QTRoXDlffyxzDStYlQfz7FU5jMVsdoCFH0VrYFz5MYNDXGWqjwlPABU=
X-Received: by 2002:a19:f203:: with SMTP id q3mr5729955lfh.166.1610317588311; 
 Sun, 10 Jan 2021 14:26:28 -0800 (PST)
MIME-Version: 1.0
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Mon, 11 Jan 2021 03:26:17 +0500
Message-ID: <CABXGCsPSYh-Nvfig4j4N8073vA6WDdhdg13meAcUgCr_pd5mYw@mail.gmail.com>
Subject: [drm:dm_plane_helper_prepare_fb [amdgpu]] *ERROR* Failed to pin
 framebuffer with error -12
To: amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 Harry Wentland <harry.wentland@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Deucher, Alexander" <alexander.deucher@amd.com>
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

SGkgZm9sa3MsCnRvZGF5IEkgam9pbmVkIHRvIHRlc3RpbmcgS2VybmVsIDUuMTEgYW5kIHNhdyB0
aGF0IHRoZSBrZXJuZWwgbG9nIHdhcwpmbG9vZGVkIHdpdGggQlVHIG1lc3NhZ2VzOgpCVUc6IHNs
ZWVwaW5nIGZ1bmN0aW9uIGNhbGxlZCBmcm9tIGludmFsaWQgY29udGV4dCBhdCBtbS92bWFsbG9j
LmM6MTc1Ngppbl9hdG9taWMoKTogMSwgaXJxc19kaXNhYmxlZCgpOiAwLCBub25fYmxvY2s6IDAs
IHBpZDogMjY2LCBuYW1lOiBrc3dhcGQwCklORk86IGxvY2tkZXAgaXMgdHVybmVkIG9mZi4KQ1BV
OiAxNSBQSUQ6IDI2NiBDb21tOiBrc3dhcGQwIFRhaW50ZWQ6IEcgICAgICAgIFcgICAgICAgIC0t
LS0tLS0tLQotLS0gIDUuMTEuMC0wLnJjMi4yMDIxMDEwOGdpdGY1ZTZjMzMwMjU0YS4xMTkuZmMz
NC54ODZfNjQgIzEKSGFyZHdhcmUgbmFtZTogU3lzdGVtIG1hbnVmYWN0dXJlciBTeXN0ZW0gUHJv
ZHVjdCBOYW1lL1JPRyBTVFJJWApYNTcwLUkgR0FNSU5HLCBCSU9TIDI4MDIgMTAvMjEvMjAyMApD
YWxsIFRyYWNlOgogZHVtcF9zdGFjaysweDhiLzB4YjAKIF9fX21pZ2h0X3NsZWVwLmNvbGQrMHhi
Ni8weGM2CiB2bV91bm1hcF9hbGlhc2VzKzB4MjEvMHg0MAogY2hhbmdlX3BhZ2VfYXR0cl9zZXRf
Y2xyKzB4OWUvMHgxOTAKIHNldF9tZW1vcnlfd2IrMHgyZi8weDgwCiB0dG1fcG9vbF9mcmVlX3Bh
Z2UrMHgyOC8weDkwIFt0dG1dCiB0dG1fcG9vbF9zaHJpbmsrMHg0NS8weGIwIFt0dG1dCiB0dG1f
cG9vbF9zaHJpbmtlcl9zY2FuKzB4YS8weDIwIFt0dG1dCiBkb19zaHJpbmtfc2xhYisweDE3Ny8w
eDNhMAogc2hyaW5rX3NsYWIrMHg5Yy8weDI5MAogc2hyaW5rX25vZGUrMHgyZTYvMHg3MDAKIGJh
bGFuY2VfcGdkYXQrMHgyZjUvMHg2NTAKIGtzd2FwZCsweDIxZC8weDRkMAogPyBkb193YWl0X2lu
dHJfaXJxKzB4ZDAvMHhkMAogPyBiYWxhbmNlX3BnZGF0KzB4NjUwLzB4NjUwCiBrdGhyZWFkKzB4
MTNhLzB4MTUwCiA/IF9fa3RocmVhZF9iaW5kX21hc2srMHg2MC8weDYwCiByZXRfZnJvbV9mb3Jr
KzB4MjIvMHgzMAoKQnV0IHRoZSBtb3N0IHVucGxlYXNhbnQgdGhpbmcgaXMgdGhhdCBhZnRlciBh
IHdoaWxlIHRoZSBtb25pdG9yIHR1cm5zCm9mZiBhbmQgZG9lcyBub3QgZ28gb24gYWdhaW4gdW50
aWwgdGhlIHJlc3RhcnQuClRoaXMgaXMgYWNjb21wYW5pZWQgYnkgYW4gZW50cnkgaW4gdGhlIGtl
cm5lbCBsb2c6CgphbWRncHUgMDAwMDowYjowMC4wOiBhbWRncHU6IDAwMDAwMDAwZmY3ZDhiOTQg
cGluIGZhaWxlZApbZHJtOmRtX3BsYW5lX2hlbHBlcl9wcmVwYXJlX2ZiIFthbWRncHVdXSAqRVJS
T1IqIEZhaWxlZCB0byBwaW4KZnJhbWVidWZmZXIgd2l0aCBlcnJvciAtMTIKCiQgZ3JlcCAiRmFp
bGVkIHRvIHBpbiBmcmFtZWJ1ZmZlciB3aXRoIGVycm9yIiAtUm4gLgouL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmM6NTgxNjoKRFJNX0VSUk9SKCJGYWls
ZWQgdG8gcGluIGZyYW1lYnVmZmVyIHdpdGggZXJyb3IgJWRcbiIsIHIpOwoKJCBnaXQgYmxhbWUg
LUwgNTgxMSw1ODIxIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtLmMKQmxhbWluZyBsaW5lczogICAwJSAoMTEvOTE2NyksIGRvbmUuCjVkNDNiZTBjY2JjMmYg
KENocmlzdGlhbiBLw7ZuaWcgMjAxNy0xMC0yNiAxODowNjoyMyArMDIwMCA1ODExKQogZG9tYWlu
ID0gQU1ER1BVX0dFTV9ET01BSU5fVlJBTTsKZTdiMDdjZWVmMmE2NSAoSGFycnkgV2VudGxhbmQg
IDIwMTctMDgtMTAgMTM6Mjk6MDcgLTA0MDAgNTgxMikKN2I3YzZjODFiM2EzNyAoSnVud2VpIFpo
YW5nICAgIDIwMTgtMDYtMjUgMTI6NTE6MTQgKzA4MDAgNTgxMykgIHIgPQphbWRncHVfYm9fcGlu
KHJibywgZG9tYWluKTsKZTdiMDdjZWVmMmE2NSAoSGFycnkgV2VudGxhbmQgIDIwMTctMDgtMTAg
MTM6Mjk6MDcgLTA0MDAgNTgxNCkgIGlmCih1bmxpa2VseShyICE9IDApKSB7CjMwYjdjNjE0N2Qx
OGQgKEhhcnJ5IFdlbnRsYW5kICAyMDE3LTEwLTI2IDE1OjM1OjE0IC0wNDAwIDU4MTUpCiBpZiAo
ciAhPSAtRVJFU1RBUlRTWVMpCjMwYjdjNjE0N2QxOGQgKEhhcnJ5IFdlbnRsYW5kICAyMDE3LTEw
LTI2IDE1OjM1OjE0IC0wNDAwIDU4MTYpCiAgICAgICAgIERSTV9FUlJPUigiRmFpbGVkIHRvIHBp
biBmcmFtZWJ1ZmZlciB3aXRoIGVycm9yICVkXG4iLCByKTsKMGYyNTdiMDk1MzFiNCAoQ2h1bm1p
bmcgWmhvdSAgIDIwMTktMDUtMDcgMTk6NDU6MzEgKzA4MDAgNTgxNykKIHR0bV9ldV9iYWNrb2Zm
X3Jlc2VydmF0aW9uKCZ0aWNrZXQsICZsaXN0KTsKZTdiMDdjZWVmMmE2NSAoSGFycnkgV2VudGxh
bmQgIDIwMTctMDgtMTAgMTM6Mjk6MDcgLTA0MDAgNTgxOCkKIHJldHVybiByOwplN2IwN2NlZWYy
YTY1IChIYXJyeSBXZW50bGFuZCAgMjAxNy0wOC0xMCAxMzoyOTowNyAtMDQwMCA1ODE5KSAgfQpl
N2IwN2NlZWYyYTY1IChIYXJyeSBXZW50bGFuZCAgMjAxNy0wOC0xMCAxMzoyOTowNyAtMDQwMCA1
ODIwKQpiYjgxMmYxZWE4N2RkIChKdW53ZWkgWmhhbmcgICAgMjAxOC0wNi0yNSAxMzozMjoyNCAr
MDgwMCA1ODIxKSAgciA9CmFtZGdwdV90dG1fYWxsb2NfZ2FydCgmcmJvLT50Ym8pOwoKV2hvIGtu
b3dzIGhvdyB0byBmaXggaXQ/CgpGdWxsIGtlcm5lbCBsb2dzIGlzIGhlcmU6ClsxXSBodHRwczov
L3Bhc3RlYmluLmNvbS9mTGFzakRIWApbMl0gaHR0cHM6Ly9wYXN0ZWJpbi5jb20vZzN3UjJyOWUK
Ci0tCkJlc3QgUmVnYXJkcywKTWlrZSBHYXZyaWxvdi4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
