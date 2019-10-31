Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9012EBF03
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 09:11:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A2F6F770;
	Fri,  1 Nov 2019 08:10:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ACED6EAD7
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 16:45:57 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id v3so6984290wmh.1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 09:45:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:user-agent
 :mime-version:content-transfer-encoding;
 bh=zYuJfx/xaP14GJ03R/o7gsh1URXh3MzsS9N/z/iKD/U=;
 b=ngUj9u/CsOb4+OtlGfNsXqQLyDvAMpC9rW5rCrOY6I26uFCgxOELUs3C0118180wY8
 vUtyw/XLgOIDADK/xR3ezk5nMOaZsAlBxFdzwcS36+6PWQs8A/4sJClILoiMIi1FTGJr
 ge8Nk7LFDJVQSQbRQuu5Nw3rP95683BCAwJfdi4T+H2pgFW25LtU59ev8Q/bjwYKe3M7
 H3Dhd+YQvG7Z0gTeC74LSH2u2roFh4mGGWJiMMm2NhWjp44enVSxaALSUSPy0jTRBLfB
 jspf63Lx1WtW+0sUJ4GakHnYmtFoFiUoa/SgK1GheY2axyNgII3T/eBuQHvdSguAK7RG
 PLew==
X-Gm-Message-State: APjAAAXUEcbdAGebdRmn1n/bKSAp865Ekq5H1L9ikSfu5d9dMuwAwRKv
 2iUYr7p4bc0roiLimNIh7LlprQtp
X-Google-Smtp-Source: APXvYqwNaDjRPNqn8Tt4tuQ5yXXdHlZz2eIkMM5FrqYOhYw0ABbk3h/93GpeFJZ/60IdwH7Qq+CsBQ==
X-Received: by 2002:a1c:1d41:: with SMTP id d62mr6039227wmd.32.1572540355071; 
 Thu, 31 Oct 2019 09:45:55 -0700 (PDT)
Received: from [192.168.0.8] (cable-86-56-108-106.cust.telecolumbus.net.
 [86.56.108.106])
 by smtp.gmail.com with ESMTPSA id 189sm4924156wmc.7.2019.10.31.09.45.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2019 09:45:54 -0700 (PDT)
Message-ID: <a12c258bde91a5e67cf19b22967ec8a8bc03f79a.camel@gmail.com>
Subject: etnaviv: [Q] regarding changes between linux kernel 4.17.17 and 5.3
From: Gert Wollny <gw.fossdev@gmail.com>
To: dri-devel@lists.freedesktop.org
Date: Thu, 31 Oct 2019 17:45:15 +0100
User-Agent: Evolution 3.30.5 
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 01 Nov 2019 08:09:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=message-id:subject:from:to:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=zYuJfx/xaP14GJ03R/o7gsh1URXh3MzsS9N/z/iKD/U=;
 b=BuZViCxF6w/M3VX69oHuCy44H3WPs+d9P6/vc3lc6VTQjZ67TQYwu5nVhJOQga0Vwm
 bbPF73VItKhBnDBmDNj25RxuMhV5LPHipFTuOb4hr76Rli4RGRoHKLTLQP7GJUSxzh8M
 sctMQMLT2ORtXcapqtNqbYHtCHkFea172eigd3XJo92WE3KVqNpzSUoKtEx2N0XDYXnQ
 E5wcQk6Qf8AZ85jLHSjrCJ+EVo8hykI+h5tQ4KUgvm4twI2v7JbS5URPEte3CK1GJ/pm
 Xrvzk+RIBfFNqo+Ai13E6TU5SSX9gtJMguLwWyOYkL7iXhWaAybRgEHY/yDiqNwLrEZK
 I9uw==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sIAoKSSdtIHRyeWluZyB0byB1cGRhdGUgZnJvbSB0aGUga2VybmVsIDQuMTcuMTcgdG8g
NS4zIG9uIGEgVXRpbGl0ZSBwcm8KKEdDMjAwMCkgYnV0IEknbSBydW5uaW5nIGEgYml0IGludG8g
dHJvdWJsZTogCgpXaGVuIG9uIDQuMTcuMTcgSSBjYW4gcnVuIFgxMSB3aXRoIHRoZSBhcm1hZGEg
ZHJpdmVyIGFuZCBJIGdldCBwcm9wZXIKT3BlbkdMLCB3aXRoIDUuMywgdGhlIHNhbWUgdXNlciBz
cGFjZSwgYW5kIHRoZSBzYW1lIGtlcm5lbCBjb25maWcKcXVlcnlpbmcgdGhlIGNoaXAgc3BlY3Mg
dmlhIAogIAogICBkcm1Db21tYW5kV3JpdGVSZWFkKGNvbm4tPmZkLCBEUk1fRVROQVZJVl9HRVRf
UEFSQU0sCiAgICAgICAgICAgICAgICAgICAgICAgJnJlcSwgc2l6ZW9mKHJlcSkpKQoKZmFpbHMs
IGFuZCBjb25zZXF1ZW50bHkgbm8gSFcgYWNjZWxlcmF0aW9uIGlzIGF2YWlsYWJsZSBhbmQgb25s
eQpsbHZtcGlwZSBpcyB1c2VkLgoKU2ltaWxhcmx5LCB3aGVuIEkgdHJ5IHRvIHJ1biB3ZXN0b24g
aXQgd29ya3Mgb24gNC4xNy4xNyB3aXRoIAogIAogIHdlc3RvbiAtQiBkcm0tYmFja2VuZC5zbyAt
LWRybS1kZXZpY2U9Y2FyZDEgCgpidXQgd2l0aCBrZXJuZWwgNS4zIEkgZ2V0IGEgbWVzc2FnZSAK
IAogICJEUk0gZGV2aWNlICdjYXJkMScgaXMgbm90IGEgS01TIGRldmljZQoKYW5kIGluaXRpYWxp
emF0aW9ucyBmYWlsZXMuIFRyeWluZyBjYXJkMCBhbHNvIGZhaWxzLCBpdCB0cmllcyB0byBmYWxs
CmJhY2sgdG8gbGx2bXBpcGUgYW5kIHRoZW4gdGhpbmdzIGZhaWwgYmVjYXVzZSBvZiBhIGxsdm1w
aXBlICBidWcgd2l0aAoiQ29yb3V0aW5lcyBTcGxpdHRpbmciIG1pc3NpbmcuCgpBbnl3YXksIGJl
Zm9yZSBJIGhhdmUgdG8gc3RhcnQgdG8gYmlzZWN0IHRoZSBrZXJuZWwsIEknZCBsaWtlIHRvIGFz
awp3aGV0aGVyIHNvbWVvbmUgaGFzIGFuIGlkZWEgd2hhdCBjb3VsZCBnbyB3cm9uZyB0aGVyZT8g
CgptYW55IHRoYW5rcyBpbiBhZHZhbmNlCgpHZXJ0IAoKICAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
