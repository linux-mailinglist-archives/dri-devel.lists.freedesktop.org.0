Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6C161AFF
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 09:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE68789A4B;
	Mon,  8 Jul 2019 07:11:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F5B89EFF
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jul 2019 18:41:17 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id c2so4540448plz.13
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Jul 2019 11:41:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=aOXdMqFM49qwxjBJs+4NYgYXPEPkbakFKpkGoCXkxdo=;
 b=auNzoCYIPX+wgwSqe0BpuxsyiHaWi4tOgsLo3Dhu7M1HJL0/fXw8f6f0VB9d5ZJOFK
 3KGwAkSlFT9lenSHBThlTEJyKGxIevKo20bXZZLbmJZpJ2zHJNQRI0BrytZhxh+KmT9/
 I0IuVZ4a2Z0jgCODokIU5v/2/aaZBK3l7OkYnVYRJZHt9z/PW5UpNDZgTs/hvv+f1mzQ
 /5rUuNNtw9Om9rhnV5pUbLPxEPnKr+iMGP2lcyST7ajcWcye5N9pIinW6KyZ2sZ+AjHP
 z0TqVqLbBwnijFyM+6SJ13jRDasIiIBosU53iYDhq3X7PwVOs0E2onPLZJLPHIdspH0w
 okJQ==
X-Gm-Message-State: APjAAAUFl4j35Ir409r1MWiFqMEhJhcI1Nm/1DotXxym9STGXpvZ5OyM
 ELMthbu1l8giAcW43NzV4z68I54Y4X0=
X-Google-Smtp-Source: APXvYqyAm4RMzl6kuXCJQEzf4ic2tJ8zFHfNjZbL8uy5oDQF7UGWEw7pnM4Ad88uLhIIaQR9cpwgCA==
X-Received: by 2002:a17:902:7087:: with SMTP id
 z7mr12613285plk.184.1562438476986; 
 Sat, 06 Jul 2019 11:41:16 -0700 (PDT)
Received: from t-1000 (c-98-210-58-162.hsd1.ca.comcast.net. [98.210.58.162])
 by smtp.gmail.com with ESMTPSA id v185sm16976966pfb.14.2019.07.06.11.41.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 06 Jul 2019 11:41:16 -0700 (PDT)
Date: Sat, 6 Jul 2019 11:41:14 -0700
From: Shobhit Kukreti <shobhitkukreti@gmail.com>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] video: radeon.h Fix Shifting signed 32 bit value by 31 bits
 problem
Message-ID: <20190706184111.GA13070@t-1000>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Mon, 08 Jul 2019 07:11:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=aOXdMqFM49qwxjBJs+4NYgYXPEPkbakFKpkGoCXkxdo=;
 b=U2atDKi7l+WkVgOuT7m/IPf37h4Jl0gh5TqnHzmPFkySaa8YO2vfBWUP13d//UgwiA
 RvMjxE43EKjznbNx3x0jLZ1/9VBzzAv2pIjvzoFOF/jMO+9F7/Q0R5hwAtK19t3Pvxwa
 LL1fh2WhZUW8zv7CNpd/a3gUjzCyFR08X456FCOVX0JxseuLy49XFvTchJBolX2oTwvr
 XIyda6PyQBh/FxUc76q/HXd7+DtcoYKnrkJ2A+TzKYbJi5pfa91TMZMcRYt884NmGSsj
 kfHNWhja2Yuf5ZOLeUwM55jYCvnCL1zaKpikNyeNyJkjnHu24XZcuO15Modrs6397Sgb
 tsMw==
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
Cc: shobhitkukreti@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4IFJCMkRfRENfQlVTWSBhbmQgSE9SWl9BVVRPX1JBVElPX0lOQyBkZWZpbmVzIHRvIHVzZSAi
VSIgY2FzdCB0bwphdm9pZCBzaGlmdGluZyBzaWduZWQgMzIgYml0IHZhbHVlcyBieSAzMSBiaXQg
cHJvYmxlbS4gVGhpcyBpcyBub3QgYQpwcm9ibGVtIGZvciBnY2MgYnVpbHQga2VybmVsLgoKSG93
ZXZlciwgdGhlIGhlYWRlciBmaWxlIGJlaW5nIGEgcHVibGljIGFwaSwgb3RoZXIgY29tcGlsZXJz
IG1heSBub3QKaGFuZGxlIHRoZSBjb25kaXRpb24gc2FmZWx5IHJlc3VsdGluZyBpbiB1bmRlZmlu
ZWQgYmVoYXZpb3IuCgpTaWduZWQtb2ZmLWJ5OiBTaG9iaGl0IEt1a3JldGkgPHNob2JoaXRrdWty
ZXRpQGdtYWlsLmNvbT4KLS0tCiBpbmNsdWRlL3ZpZGVvL3JhZGVvbi5oIHwgNCArKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2luY2x1ZGUvdmlkZW8vcmFkZW9uLmggYi9pbmNsdWRlL3ZpZGVvL3JhZGVvbi5oCmluZGV4IDAw
NWVhZTEuLmNiMGE1ZjYgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvdmlkZW8vcmFkZW9uLmgKKysrIGIv
aW5jbHVkZS92aWRlby9yYWRlb24uaApAQCAtNTMxLDcgKzUzMSw3IEBACiAjZGVmaW5lIFJCMkRf
RENfRkxVU0hfMkQJCQkgICAoMSA8PCAwKQogI2RlZmluZSBSQjJEX0RDX0ZSRUVfMkQJCQkJICAg
KDEgPDwgMikKICNkZWZpbmUgUkIyRF9EQ19GTFVTSF9BTEwJCQkgICAoUkIyRF9EQ19GTFVTSF8y
RCB8IFJCMkRfRENfRlJFRV8yRCkKLSNkZWZpbmUgUkIyRF9EQ19CVVNZCQkJCSAgICgxIDw8IDMx
KQorI2RlZmluZSBSQjJEX0RDX0JVU1kJCQkJICAgKDFVIDw8IDMxKQogCiAvKiBEU1RDQUNIRV9N
T0RFIGJpdHMgY29uc3RhbnRzICovCiAjZGVmaW5lIFJCMkRfRENfQVVUT0ZMVVNIX0VOQUJMRSAg
ICAgICAgICAgICAgICAgICAoMSA8PCA4KQpAQCAtNjcyLDcgKzY3Miw3IEBACiAjZGVmaW5lIEhP
UlpfU1RSRVRDSF9FTkFCTEUJCQkgICAoMSA8PCAyNSkKICNkZWZpbmUgSE9SWl9BVVRPX1JBVElP
CQkJCSAgICgxIDw8IDI3KQogI2RlZmluZSBIT1JaX0ZQX0xPT1BfU1RSRVRDSAkJCSAgICgweDcg
PDwgMjgpCi0jZGVmaW5lIEhPUlpfQVVUT19SQVRJT19JTkMJCQkgICAoMSA8PCAzMSkKKyNkZWZp
bmUgSE9SWl9BVVRPX1JBVElPX0lOQwkJCSAgICgxVSA8PCAzMSkKIAogCiAvKiBGUF9WRVJUX1NU
UkVUQ0ggYml0IGNvbnN0YW50cyAqLwotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
