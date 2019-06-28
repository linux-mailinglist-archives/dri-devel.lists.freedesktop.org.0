Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A87C15B13E
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 20:27:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE41E89DA5;
	Sun, 30 Jun 2019 18:27:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8287D6E8C3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 10:23:12 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id r16so3831384wrl.11
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 03:23:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:user-agent
 :mime-version:content-transfer-encoding;
 bh=JammyaAwwMcju9S4cMNog+KojBR82/CjF4x9gSPa6vY=;
 b=NvxKV4MXizLZ94SPN8T2BxGkA89z0PuSTY5y//AvRIj+31whp/eiiZQoT4dFKqhCJE
 UOzfJzQFBYGq/WgiHCD99lvu6K7afn2YtIejsuphzlFK5Q+3c+0lO5JZKwSESshLm7Zc
 rYqJ5kGhmLkWMsKwmwQexheZaGONUeP2m/crCOaQ0hLAyqJp+tdEVL6y/EcNkxmlRXDY
 EEkihTppBW8fJ6bknBFa4j3mTPKXCF9ciDHQezkZwKVHxQ+dK0Wqt4UPtLZVPKSV/nLC
 RHrD0FV8aHo3rLfaQTw5FrMb9XFDBlVgrtIn2AFzrmGLGt48fy3F8WEMOB9ui01ObN/+
 Abiw==
X-Gm-Message-State: APjAAAVBwOvIX2MHdHIhB1Xv5Ok46A8IzjDqp0fIj9Lub+pEMzbhWnaW
 NY9of3w+oqk8pQdPoP1bqJo=
X-Google-Smtp-Source: APXvYqwV8Fe4NQW9OCj0kB7wnk2RKaz6Pjyd+b1CBmcgfSt4LMX8BBJUrJdCn/x34XT38HWsFIhBgA==
X-Received: by 2002:a5d:694a:: with SMTP id r10mr7457796wrw.345.1561717391215; 
 Fri, 28 Jun 2019 03:23:11 -0700 (PDT)
Received: from Timur-XPS (catv-80-99-228-232.catv.broadband.hu.
 [80.99.228.232])
 by smtp.gmail.com with ESMTPSA id t63sm1300134wmt.6.2019.06.28.03.23.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 03:23:10 -0700 (PDT)
Message-ID: <91de711591780e83c70e8f61747725855f6dee99.camel@gmail.com>
Subject: Why is Thunderbolt 3 limited to 2.5 GT/s on Linux?
From: Timur =?ISO-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 "michael.jamet@intel.com" <michael.jamet@intel.com>
Date: Fri, 28 Jun 2019 12:23:09 +0200
User-Agent: Evolution 3.32.3 (3.32.3-1.fc30) 
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 30 Jun 2019 18:26:11 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=JammyaAwwMcju9S4cMNog+KojBR82/CjF4x9gSPa6vY=;
 b=lZDhfDNCseZgdJVMFLSkrdN1WgO3Sk/loRICBU+ShYk8PN7zmXVdFlvqyoCSpNNNNM
 4pzabR9CzCc6dai9qS2YN9GXP+vH8EMvChOivOoLoaDskfhzUTiSJBitWBHHv0KDMJX/
 R+oDei2edZE0XNhs3SuWOLCHAHC1MOnPj1j7yScEm5GZ15rJX0S6VsVrKDh/h05pMdIc
 6f+/2H6Xpy4fTaRGXjpmHug0JhK7vIMK1q7khPJSsGylBS9kEi56UxTtLkNnYxwx+nQq
 0fXcIyLScLhMrhKbEkhoM6PrJtX6JtbpEfDlHFqU1Rfk1tTvqt9xbsaKv+yWkeKMhNeR
 WVFA==
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgZ3V5cywKCkkgdXNlIGFuIEFNRCBSWCA1NzAgaW4gYSBUaHVuZGVyYm9sdCAzIGV4dGVybmFs
IEdQVSBib3guCmRtZXNnIGdpdmVzIG1lIHRoZSBmb2xsb3dpbmcgbWVzc2FnZToKcGNpIDAwMDA6
M2E6MDAuMDogOC4wMDAgR2IvcyBhdmFpbGFibGUgUENJZSBiYW5kd2lkdGgsIGxpbWl0ZWQgYnkg
Mi41IEdUL3MgeDQgbGluayBhdCAwMDAwOjA0OjA0LjAgKGNhcGFibGUgb2YgMzEuNTA0IEdiL3Mg
d2l0aCA4IEdUL3MgeDQgbGluaykKCkhlcmUgaXMgYSB0cmVlIHZpZXcgb2YgdGhlIGRldmljZXMg
YXMgd2VsbCBhcyB0aGUgb3V0cHV0IG9mIGxzcGNpIC12dnY6Cmh0dHBzOi8vcGFzdGViaW4uY29t
L0NTc1MyYWtaCgpUaGUgY3JpdGljYWwgcGF0aCBvZiB0aGUgZGV2aWNlIHRyZWUgbG9va3MgbGlr
ZSB0aGlzOgoKMDA6MWMuNCBJbnRlbCBDb3Jwb3JhdGlvbiBTdW5yaXNlIFBvaW50LUxQIFBDSSBF
eHByZXNzIFJvb3QgUG9ydCAjNSAocmV2IGYxKQowMzowMC4wIEludGVsIENvcnBvcmF0aW9uIEpI
TDY1NDAgVGh1bmRlcmJvbHQgMyBCcmlkZ2UgKEMgc3RlcCkgW0FscGluZSBSaWRnZSA0QyAyMDE2
XSAocmV2IDAyKQowNDowNC4wIEludGVsIENvcnBvcmF0aW9uIEpITDY1NDAgVGh1bmRlcmJvbHQg
MyBCcmlkZ2UgKEMgc3RlcCkgW0FscGluZSBSaWRnZSA0QyAyMDE2XSAocmV2IDAyKQozYTowMC4w
IEludGVsIENvcnBvcmF0aW9uIERTTDY1NDAgVGh1bmRlcmJvbHQgMyBCcmlkZ2UgW0FscGluZSBS
aWRnZSA0QyAyMDE1XQozYjowMS4wIEludGVsIENvcnBvcmF0aW9uIERTTDY1NDAgVGh1bmRlcmJv
bHQgMyBCcmlkZ2UgW0FscGluZSBSaWRnZSA0QyAyMDE1XQozYzowMC4wIEFkdmFuY2VkIE1pY3Jv
IERldmljZXMsIEluYy4gW0FNRC9BVEldIEVsbGVzbWVyZSBbUmFkZW9uIFJYIDQ3MC80ODAvNTcw
LzU3MFgvNTgwLzU4MFgvNTkwXSAocmV2IGVmKQoKSGVyZSBpcyB0aGUgd2VpcmQgcGFydDoKCkFj
Y29kaW5nIHRvIGxzcGNpLCBhbGwgb2YgdGhlc2UgZGV2aWNlcyByZXBvcnQgaW4gdGhlaXIgTG5r
Q2FwIHRoYXQKdGhleSBzdXBwb3J0IDggR1QvcywgZXhjZXB0IHRoZSAwNDowNC4wIGFuZCAzYTow
MC4wIHdoaWNoIHNheSB0aGV5IG9ubHkKc3VwcG9ydCAyLjUgR1Qvcy4gQ29udHJhZGljdG9yeSB0
byBsc3BjaSwgc3lzZnMgb24gdGhlIG90aGVyIGhhbmQgc2F5cwp0aGF0IGJvdGggb2YgdGhlbSBh
cmUgY2FwYWJsZSBvZiA4IEdUL3MgYXMgd2VsbDoKIi9zeXMvYnVzL3BjaS9kZXZpY2VzLzAwMDA6
MDQ6MDQuMC9tYXhfbGlua19zcGVlZCIgYW5kCiIvc3lzL2J1cy9wY2kvZGV2aWNlcy8wMDAwOjNh
OjAwLjAvbWF4X2xpbmtfc3BlZWQiIGFyZSA4IEdUL3MuCkl0IHNlZW1zIHRoYXQgdGhlcmUgaXMg
YSBkaXNjcmVwYW5jeSBiZXR3ZWVuIHdoYXQgbHNwY2kgdGhpbmtzIGFuZCB3aGF0CnRoZSBkZXZp
Y2VzIGFyZSBhY3R1YWxseSBjYXBhYmxlIG9mLgoKUXVlc3Rpb25zOgoKMS4gV2h5IGFyZSB0aGVy
ZSBmb3VyIGJyaWRnZSBkZXZpY2VzPyAwNDowMC4wLCAwNDowMS4wIGFuZCAwNDowMi4wIGxvb2sK
c3VwZXJmbHVvdXMgdG8gbWUgYW5kIG5vdGhpbmcgaXMgY29ubmVjdGVkIHRvIHRoZW0uIEl0IGFj
dHVhbGx5IGdpdmVzCm1lIHRoZSBmZWVsaW5nIHRoYXQgdGhlIFRCMyBkcml2ZXIgY3JlYXRlcyA0
IGRldmljZXMgd2l0aCAyLjUgR1QvcwplYWNoLCBpbnN0ZWFkIG9mIG9uZSBkZXZpY2UgdGhhdCBj
YW4gZG8gdGhlIGZ1bGwgOCBHVC9zLgoKMi4gV2h5IGFyZSBzb21lIG9mIHRoZSBicmlkZ2UgZGV2
aWNlcyBvbmx5IGNhcGFibGUgb2YgMi41IEdUL3MKYWNjb3JkaW5nIHRvIGxzcGNpPwoKMy4gSXMg
aXQgcG9zc2libGUgdG8gbWFudWFsbHkgc2V0IHRoZW0gdG8gOCBHVC9zPwoKVGhhbmtzIGluIGFk
dmFuY2UgZm9yIHlvdXIgYW5zd2VycyEKCkJlc3QgcmVnYXJkcywKVGltCgoKCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
