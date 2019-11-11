Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF5FF7FC1
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 20:23:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35A066E25E;
	Mon, 11 Nov 2019 19:23:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15E616E25E
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 19:23:41 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MTi9N-1iK6p22quT-00Tzhu; Mon, 11 Nov 2019 20:23:05 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] video: fbdev: atyfb: only use ioremap_uc() on i386 and ia64
Date: Mon, 11 Nov 2019 20:22:50 +0100
Message-Id: <20191111192258.2234502-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:G7fVZrN2su3CbpdSj/kq71EeeeKTYZoe6x6zvxOtFZEbiSWv0zR
 Xw+By6rp1RvmAwdIceDuVMJG6W49a4GYU5M7TsOb4PVcuFbmtc4zDHnbboKsEbR9a/vwmVG
 gMfZ9mqmc9EZcj6sVDak1e2jRHvgU1GfZC4GJJZ+6geK8zKloktS54pQoixLcw3apObAvgo
 37ky04f59Xwy19jvSnR4Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gTxDTasTuXo=:DtDj9YCkmH7bphqvBqN2kc
 y2HCCFlcKtkkxIT1zvuffgBD/NjjOrR4LAaUWC38J7zAv3ccLY7YoCKr7esjNGTPU4Bm7vfNW
 3+Sj80/UK2nG5u3ic8f7jrj5w+4S1r9X4YsEQ+46xyqiQsao7J6xBlOrqgR1IrpM3fwT9OBuB
 oqdwG3t6hG3AqDJxC09ls/SRfvVndfBmyO3ruCNtKApuxM5M2kjSBPYq1ZCt18nmkxnwNm5h9
 48Ra3ulZBQxlDoJJ4ceP+De+h+EU0nZknsRvpNuVJLPZw8nqgksAWCComGiuatMGtr3RsPXrO
 NxMgDA0DFe2/FUx21eVhAt2TD39hUOHS2W4/RPBFZ1nrffYh6we0SK+AWn75lOjkzTiz5jdBt
 sFKRUSl2edXQXlZStoDBByKUF7qMwQBvn6ZKt8Q0+Is0FyaGCUyCxVA8QzH5cH87e8eHdKQB/
 pXGZpoJGuNGDlhIg7LO38RnKy0xfTlWMsZcFT0CcHuD14fzrXfQ4EJfQi3VlONjX2pMKmTYoy
 uYRBC9HrfTpInyi+GMPZOE3NoNWZ15CzZC7vEsPxb63kNjQyglrGrjnLHq/z39MNcVvaIY/9G
 T17lcEpSTAVBSOo85r2PPWOI6B8f9PKLpVlW4lvn8MGWYqz3UMX8v2Y6hMYvCfpjCMMInNxF1
 B408DQyNh/c7kt24ojj+STA80/0IuB8tVTbT6BCwyDzwBq615+5FIHAe37/brRYdCA5WJHYhJ
 aboiguFX21swpruRbFolY595RugViK+R8oN9ovjz9pLuBYx0eF7TMmxkMk9A3LUZTTOK9pRSh
 KgVlttJjfHZ2lQelvU3AwaGH06fVl23G9NaclTxJ8k1DV1iUcl4W6Y2Cy2WrPO32aqWaY3ZqG
 QuRPIIlhHo3Yt4D6gr9w==
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
Cc: Fenghua Yu <fenghua.yu@intel.com>, linux-fbdev@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, linux-ia64@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 x86@kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Souptick Joarder <jrdr.linux@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

aW9yZW1hcF91YygpIGlzIG9ubHkgbWVhbmluZ2Z1bCBvbiBvbGQgeDg2LTMyIHN5c3RlbXMgd2l0
aCB0aGUgUEFUCmV4dGVuc2lvbiwgYW5kIG9uIGlhNjQgd2l0aCBpdHMgc2xpZ2h0bHkgdW5jb252
ZW50aW9uYWwgaW9yZW1hcCgpCmJlaGF2aW9yLCBldmVyeXdoZXJlIGVsc2UgdGhpcyBpcyB0aGUg
c2FtZSBhcyBpb3JlbWFwKCkgYW55d2F5LgoKQ2hhbmdlIHRoZSBvbmx5IGRyaXZlciB0aGF0IHN0
aWxsIHJlZmVyZW5jZXMgaW9yZW1hcF91YygpIHRvIG9ubHkgZG8gc28Kb24geDg2LTMyL2lhNjQg
aW4gb3JkZXIgdG8gYWxsb3cgcmVtb3ZpbmcgdGhhdCBpbnRlcmZhY2UgYXQgc29tZQpwb2ludCBp
biB0aGUgZnV0dXJlIGZvciB0aGUgb3RoZXIgYXJjaGl0ZWN0dXJlcy4KCk9uIHNvbWUgYXJjaGl0
ZWN0dXJlcywgaW9yZW1hcF91YygpIGp1c3QgcmV0dXJucyBOVUxMLCBjaGFuZ2luZwp0aGUgZHJp
dmVyIHRvIGNhbGwgaW9yZW1hcCgpIG1lYW5zIHRoYXQgdGhleSBub3cgaGF2ZSBhIGNoYW5jZQpv
ZiB3b3JraW5nIGNvcnJlY3RseS4KClNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRA
YXJuZGIuZGU+Ci0tLQogZHJpdmVycy92aWRlby9mYmRldi9hdHkvYXR5ZmJfYmFzZS5jIHwgNCAr
KysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy92aWRlby9mYmRldi9hdHkvYXR5ZmJfYmFzZS5jIGIvZHJpdmVycy92aWRlby9mYmRldi9hdHkv
YXR5ZmJfYmFzZS5jCmluZGV4IDc5ZDU0ODc0NmVmZC4uYmRiYWNhNzIwMGIyIDEwMDY0NAotLS0g
YS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2F0eS9hdHlmYl9iYXNlLmMKKysrIGIvZHJpdmVycy92aWRl
by9mYmRldi9hdHkvYXR5ZmJfYmFzZS5jCkBAIC0zNDIwLDExICszNDIwLDE1IEBAIHN0YXRpYyBp
bnQgYXR5ZmJfc2V0dXBfZ2VuZXJpYyhzdHJ1Y3QgcGNpX2RldiAqcGRldiwgc3RydWN0IGZiX2lu
Zm8gKmluZm8sCiAJfQogCiAJaW5mby0+Zml4Lm1taW9fc3RhcnQgPSByYWRkcjsKKyNpZiBkZWZp
bmVkKF9faTM4Nl9fKSB8fCBkZWZpbmVkKF9faWE2NF9fKQogCS8qCiAJICogQnkgdXNpbmcgc3Ry
b25nIFVDIHdlIGZvcmNlIHRoZSBNVFJSIHRvIG5ldmVyIGhhdmUgYW4KIAkgKiBlZmZlY3Qgb24g
dGhlIE1NSU8gcmVnaW9uIG9uIGJvdGggbm9uLVBBVCBhbmQgUEFUIHN5c3RlbXMuCiAJICovCiAJ
cGFyLT5hdGlfcmVnYmFzZSA9IGlvcmVtYXBfdWMoaW5mby0+Zml4Lm1taW9fc3RhcnQsIDB4MTAw
MCk7CisjZWxzZQorCXBhci0+YXRpX3JlZ2Jhc2UgPSBpb3JlbWFwKGluZm8tPmZpeC5tbWlvX3N0
YXJ0LCAweDEwMDApOworI2VuZGlmCiAJaWYgKHBhci0+YXRpX3JlZ2Jhc2UgPT0gTlVMTCkKIAkJ
cmV0dXJuIC1FTk9NRU07CiAKLS0gCjIuMjAuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
