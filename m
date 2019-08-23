Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E889A5F0
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 05:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99F016E505;
	Fri, 23 Aug 2019 03:15:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com
 [IPv6:2607:f8b0:4864:20::e2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F4746E505
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 03:15:35 +0000 (UTC)
Received: by mail-vs1-xe2d.google.com with SMTP id s5so5312236vsi.10
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 20:15:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=36Dr0pJWRDwNNABAuEtjFFF4yxkdQ4/1F+Bl7/SD3qc=;
 b=Q6Qa4/F43EWbzDEVGNgW0Wl4tJE+x/Yw0pMW9B+PqBW78IuNi+uCOdSKs21E5Xceu8
 wDzjB+S2T6UzGI2tBriyhZJHOKh+eWSboU1fRv02cn/8M6R/UCvoohgy8hTzPW7drSJK
 z5X4F317027tNHcK6ItXca9bJUSRI24cgNYIkKRr2PazSPylaNsnkPYA0TFm2ovorIN3
 I7EAt116afynTEoFNH+zKQWb5V/PuULWhtS3mhdYFzSpiO/SpmkZZaX2V3/f8TG5VSW5
 QYRl8VKDt9xhudx2JGEjX9kbHfwG6cxUB+hkgH/bAwxMN2GLuWSmicA03H8omSmDZkFn
 DZlg==
X-Gm-Message-State: APjAAAWwueqo9G/2eN/zTOdXEwLNUn8OujI2d8DymsHwfZxUoAJOWuGl
 Oj7gL7235dE67b/Rhj9rOFppyAmfDeO8ipbv4q+wqA62
X-Google-Smtp-Source: APXvYqwZlFWQ7mTSmdhKOkdUYSeYA6imNSmTqIie0YavyVFe5TGqdHu4if13EKNKxVUj9esPu/h3VR3IVJWLowJEPZQ=
X-Received: by 2002:a67:ce05:: with SMTP id s5mr543629vsl.121.1566530134338;
 Thu, 22 Aug 2019 20:15:34 -0700 (PDT)
MIME-Version: 1.0
From: Ben Skeggs <skeggsb@gmail.com>
Date: Fri, 23 Aug 2019 13:15:23 +1000
Message-ID: <CACAvsv713t2_BQ44gVV7Lqic6Vwmhq0r4FB5v-t0kD1jzFrbmQ@mail.gmail.com>
Subject: nouveau-fixes-5.3
To: ML dri-devel <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=36Dr0pJWRDwNNABAuEtjFFF4yxkdQ4/1F+Bl7/SD3qc=;
 b=LuFl3q9z15kZ8UW3SPGsAvuVAN9h14+7zdX7zph3mppIXRJ/nQHy6N3K0rZpOp4j7L
 UuFmcBUiT9k3OZMukgZQBOE2M+ua9dcHf1x58sFlpX2PqmVU32JuXi1L4IL15SJF7ShV
 L6LsP2sHXxKnHyY1zs9Rs9Vt/hONKPTHLQ6pRp32u8KyKBn8DhKsrvuK2RmNPj2+vPbM
 YcDggI/K2icPi2/kI0EpgY1zJZTTaWJLxZi+Zuusl/tKTZfmOwZWl0EYMCVAZu/QoBxB
 wF0nSSsb/lS8GiCw/9X1J8nmVk9Xy8rbgwijW/3e3mItM3yLour9dLAZ3zdLaTowHXdA
 7JMw==
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

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA0ZDM1MmRiZDU4NTBiZmM3NTI2MDlk
NDZiNWM4NDAzYWUwYmQ1MTYzOgoKICBkcm0vbm91dmVhdS9zZWNib290L2dwMTAyLTogcmVtb3Zl
IFdBUiBmb3IgU0VDMiBSVE9TIHN0YXJ0IGJ1ZwooMjAxOS0wNy0xOSAxNjoyNjo1MSArMTAwMCkK
CmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6Ly9naXRodWIu
Y29tL3NrZWdnc2IvbGludXggbGludXgtNS4zCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAg
dG8gYzM1OGViZjU5NjM0ZjA2ZDhlZDE3NmRhNjUxZWMxNTBkZjNjODY4NjoKCiAgZHJtL25vdXZl
YXU6IERvbid0IHJldHJ5IGluZmluaXRlbHkgd2hlbiByZWNlaXZpbmcgbm8gZGF0YSBvbiBpMmMK
b3ZlciBBVVggKDIwMTktMDgtMjMgMTI6NDI6NDMgKzEwMDApCgotLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkx5dWRlIFBhdWwg
KDEpOgogICAgICBkcm0vbm91dmVhdTogRG9uJ3QgcmV0cnkgaW5maW5pdGVseSB3aGVuIHJlY2Vp
dmluZyBubyBkYXRhIG9uIGkyYyBvdmVyIEFVWAoKIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252
a20vc3ViZGV2L2kyYy9hdXguYyB8IDI0ICsrKysrKysrKysrKysrKysrLS0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
