Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C68F4E50EC
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 12:02:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE2B10E6A6;
	Wed, 23 Mar 2022 11:01:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F8C10E1A0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 19:01:28 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id r22so18210407ejs.11
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 12:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=mzQXiS0S4RdieSwMTuDb23Hr413AV3AR/1D7aYWgeF0=;
 b=Z0bpdIynVZj6ctk1FIMfNBQhV7vVKdsDv3pAkB8aOIU1z1cDSrX9d3oeI/BKyBaR/7
 +ZarA+Z6bY0QQvarMgjQWKUH0kAjUpfOW//9Bv6LwCuRFXnoPvhEJ3dTr4IlfHtTH3gL
 rtzzD2M9JthdF3aXtm1JlImqPwjzufji5nmIf55qbA1nsGAWlnsENz5UtBpLNQ5Nmtv9
 E/LQ7XXNgV7L16thtBFYpNi4Gf8EQQ8uEdkB1zoQfRMj95rhqfos2AnpfDt2/OZcSGjh
 /6R7ZWxjzAOIRlIp1LLFQq1oxfCTa+uqJEbR3iqIi1m6Jj21O/k4OOQ502gIzbw0rFjN
 P3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=mzQXiS0S4RdieSwMTuDb23Hr413AV3AR/1D7aYWgeF0=;
 b=YYBq8WkZUKcvAxWn3lgo4dcrDcYCrOuaXw8QSbQ/ap08lhJ7Atr+YM3LPYFdoRNBHO
 rmpSKzKrkORcRTbVaNIpVVuYej1g0c5DfMKS0LiCYwchuu+AH1rE9ekSMzf6sx/vCa4+
 QjEk3exQmEYsHkAPTQhoxRfN2WV5qNyNt371DeV+HjQ5u37FJE3ewYE/lbbcmFddNP9x
 UzYlSDpQdlUKnvID1B1bKPENGMYVdvQOKM6FoB6BgFEm+BPahJXElsysiYGb+tbiDqf2
 jLKENpG4JLNOB2AB9IOAozJiAZNq/Uf6qOiGJqR+VoWcCpMvgBMmOGHLhLBEXdXckAs/
 TQeg==
X-Gm-Message-State: AOAM530ODH4DbY19f7EsYEUk+P/BSQ8aXtlLy6xVWhS4pJC43OTzj56G
 WWjUw0OF2BaqxcOaHD+7/oik770PRe2Xd4GMtNWNGMIF0499Dwg/
X-Google-Smtp-Source: ABdhPJxTp3kZGcoicAzg2GzNiQuJ38omoEoYZhbzM/I8MMtiJoyIp1t7qt4/7IBXU77NwK71yn+sZ4lZWi1WzLz5iy4=
X-Received: by 2002:a17:906:5d06:b0:6df:b0ac:59c2 with SMTP id
 g6-20020a1709065d0600b006dfb0ac59c2mr22888758ejt.758.1647975686314; Tue, 22
 Mar 2022 12:01:26 -0700 (PDT)
MIME-Version: 1.0
From: Won Chung <wonchung@google.com>
Date: Tue, 22 Mar 2022 12:01:15 -0700
Message-ID: <CAOvb9yjqnqGL9s4dDKyBfyybFftFXKKOgTWAxPJ3WRHF6Tv1OQ@mail.gmail.com>
Subject: Question regarding using Driver Component Framework (crashing kernel)
To: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="000000000000629f8305dad33d48"
X-Mailman-Approved-At: Wed, 23 Mar 2022 11:01:42 +0000
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
Cc: Benson Leung <bleung@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Prashant Malani <pmalani@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000629f8305dad33d48
Content-Type: text/plain; charset="UTF-8"

Hi,

I am not sure if this is the correct mailing list to ask about Driver
Component Framework, so if I am mistaken, I would appreciate it if
anyone can correct me to the right direction.

I have a quick question on using driver component framework and a
strange crash I am seeing when I use component framework.

There is then component framework currently being used for typec
connector, as below
https://elixir.bootlin.com/linux/latest/source/drivers/usb/typec/port-mapper.c
We add component for usb port to link it with typec connector, as below
https://elixir.bootlin.com/linux/latest/source/drivers/usb/core/port.c#L622
https://elixir.bootlin.com/linux/latest/source/drivers/usb/core/port.c#L568

We are trying to do something similar for usb4 port, add component to
link to typec connector.
I have attached a patch to this email for reference.
However, this change causes a crash in kernel for some devices.
The crash is too early in the kernel that it is not giving any logs at all.
This crash is somehow fixed when we change usb4 config from =y
(built-in) to =m (loadable module).
So, I am curious if there are some aspects in the component framework
that depends on whether the device with a component added is a
built-in or loadable module.

If anyone has seen a similar issue or have an idea on what is
happening, can you share your thoughts on what might be the issue and
how the crash can be avoided?
Thank you very much!

Won

--000000000000629f8305dad33d48
Content-Type: application/octet-stream; name="usb4_connectors.diff"
Content-Disposition: attachment; filename="usb4_connectors.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_l12hzqgj0>
X-Attachment-Id: f_l12hzqgj0

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdGh1bmRlcmJvbHQvcmV0aW1lci5jIGIvZHJpdmVycy90aHVu
ZGVyYm9sdC9yZXRpbWVyLmMNCmluZGV4IDhjMjliZDU1NmFlMDQuLjhhNDAyODMyNDQ5YTMgMTAw
NjQ0DQotLS0gYS9kcml2ZXJzL3RodW5kZXJib2x0L3JldGltZXIuYw0KKysrIGIvZHJpdmVycy90
aHVuZGVyYm9sdC9yZXRpbWVyLmMNCkBAIC0xNiw2ICsxNiwyNyBAQA0KIA0KICNkZWZpbmUgVEJf
TUFYX1JFVElNRVJfSU5ERVgJNg0KIA0KK3N0YXRpYyBpbnQgY29ubmVjdG9yX2JpbmQoc3RydWN0
IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICpjb25uZWN0b3IsIHZvaWQgKmRhdGEpDQorew0K
KwlpbnQgcmV0Ow0KKw0KKwlyZXQgPSBzeXNmc19jcmVhdGVfbGluaygmZGV2LT5rb2JqLCAmY29u
bmVjdG9yLT5rb2JqLCAiY29ubmVjdG9yIik7DQorCWlmIChyZXQpDQorCQlyZXR1cm4gcmV0Ow0K
Kw0KKwlyZXQgPSBzeXNmc19jcmVhdGVfbGluaygmY29ubmVjdG9yLT5rb2JqLCAmZGV2LT5rb2Jq
LCBkZXZfbmFtZShkZXYpKTsNCisJaWYgKHJldCkNCisJCXN5c2ZzX3JlbW92ZV9saW5rKCZkZXYt
PmtvYmosICJjb25uZWN0b3IiKTsNCisNCisJcmV0dXJuIHJldDsNCit9DQorDQorc3RhdGljIHZv
aWQgY29ubmVjdG9yX3VuYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2UgKmNv
bm5lY3Rvciwgdm9pZCAqZGF0YSkNCit7DQorCXN5c2ZzX3JlbW92ZV9saW5rKCZjb25uZWN0b3It
PmtvYmosIGRldl9uYW1lKGRldikpOw0KKwlzeXNmc19yZW1vdmVfbGluaygmZGV2LT5rb2JqLCAi
Y29ubmVjdG9yIik7DQorfQ0KKw0KIHN0YXRpYyBpbnQgdGJfcmV0aW1lcl9udm1fcmVhZCh2b2lk
ICpwcml2LCB1bnNpZ25lZCBpbnQgb2Zmc2V0LCB2b2lkICp2YWwsDQogCQkJICAgICAgIHNpemVf
dCBieXRlcykNCiB7DQpAQCAtMzg5LDYgKzQxMCwxNyBAQCBzdGF0aWMgaW50IHRiX3JldGltZXJf
YWRkKHN0cnVjdCB0Yl9wb3J0ICpwb3J0LCB1OCBpbmRleCwgdTMyIGF1dGhfc3RhdHVzKQ0KIAkJ
cmV0dXJuIHJldDsNCiAJfQ0KIA0KKwlydC0+Y29ubmVjdG9yX29wcy5iaW5kID0gY29ubmVjdG9y
X2JpbmQ7DQorCXJ0LT5jb25uZWN0b3Jfb3BzLnVuYmluZCA9IGNvbm5lY3Rvcl91bmJpbmQ7DQor
DQorCXJldCA9IGNvbXBvbmVudF9hZGQoJnJ0LT5kZXYsICZydC0+Y29ubmVjdG9yX29wcyk7DQor
CWlmIChyZXQpIHsNCisJCWRldl93YXJuKCZydC0+ZGV2LCAiZmFpbGVkIHRvIGFkZCBjb21wb25l
bnRcbiIpOw0KKwkJdGJfbnZtX2ZyZWUocnQtPm52bSk7DQorCQlkZXZpY2VfdW5yZWdpc3Rlcigm
cnQtPmRldik7DQorCQlyZXR1cm4gcmV0Ow0KKwl9DQorDQogCWRldl9pbmZvKCZydC0+ZGV2LCAi
bmV3IHJldGltZXIgZm91bmQsIHZlbmRvcj0lI3ggZGV2aWNlPSUjeFxuIiwNCiAJCSBydC0+dmVu
ZG9yLCBydC0+ZGV2aWNlKTsNCiANCkBAIC00MDUsNiArNDM3LDcgQEAgc3RhdGljIGludCB0Yl9y
ZXRpbWVyX2FkZChzdHJ1Y3QgdGJfcG9ydCAqcG9ydCwgdTggaW5kZXgsIHUzMiBhdXRoX3N0YXR1
cykNCiBzdGF0aWMgdm9pZCB0Yl9yZXRpbWVyX3JlbW92ZShzdHJ1Y3QgdGJfcmV0aW1lciAqcnQp
DQogew0KIAlkZXZfaW5mbygmcnQtPmRldiwgInJldGltZXIgZGlzY29ubmVjdGVkXG4iKTsNCisJ
Y29tcG9uZW50X2RlbCgmcnQtPmRldiwgJnJ0LT5jb25uZWN0b3Jfb3BzKTsNCiAJdGJfbnZtX2Zy
ZWUocnQtPm52bSk7DQogCWRldmljZV91bnJlZ2lzdGVyKCZydC0+ZGV2KTsNCiB9DQpkaWZmIC0t
Z2l0IGEvZHJpdmVycy90aHVuZGVyYm9sdC90Yi5oIGIvZHJpdmVycy90aHVuZGVyYm9sdC90Yi5o
DQppbmRleCBiNmZjZDhkNDUzMjQzLi5kZmE1MWJkYmMzZDgzIDEwMDY0NA0KLS0tIGEvZHJpdmVy
cy90aHVuZGVyYm9sdC90Yi5oDQorKysgYi9kcml2ZXJzL3RodW5kZXJib2x0L3RiLmgNCkBAIC05
LDYgKzksNyBAQA0KICNpZm5kZWYgVEJfSF8NCiAjZGVmaW5lIFRCX0hfDQogDQorI2luY2x1ZGUg
PGxpbnV4L2NvbXBvbmVudC5oPg0KICNpbmNsdWRlIDxsaW51eC9udm1lbS1wcm92aWRlci5oPg0K
ICNpbmNsdWRlIDxsaW51eC9wY2kuaD4NCiAjaW5jbHVkZSA8bGludXgvdGh1bmRlcmJvbHQuaD4N
CkBAIC0yODQsNiArMjg1LDcgQEAgc3RydWN0IHVzYjRfcG9ydCB7DQogCXN0cnVjdCB0Yl9wb3J0
ICpwb3J0Ow0KIAlib29sIGNhbl9vZmZsaW5lOw0KIAlib29sIG9mZmxpbmU7DQorCXN0cnVjdCBj
b21wb25lbnRfb3BzIGNvbm5lY3Rvcl9vcHM7DQogfTsNCiANCiAvKioNCkBAIC0zMDYsNiArMzA4
LDcgQEAgc3RydWN0IHRiX3JldGltZXIgew0KIAlzdHJ1Y3QgdGJfcG9ydCAqcG9ydDsNCiAJc3Ry
dWN0IHRiX252bSAqbnZtOw0KIAl1MzIgYXV0aF9zdGF0dXM7DQorCXN0cnVjdCBjb21wb25lbnRf
b3BzIGNvbm5lY3Rvcl9vcHM7DQogfTsNCiANCiAvKioNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3Ro
dW5kZXJib2x0L3VzYjRfcG9ydC5jIGIvZHJpdmVycy90aHVuZGVyYm9sdC91c2I0X3BvcnQuYw0K
aW5kZXggMjllMmE0ZjljOWY1ZS4uNmRmNDI0N2M4ZjdhYyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMv
dGh1bmRlcmJvbHQvdXNiNF9wb3J0LmMNCisrKyBiL2RyaXZlcnMvdGh1bmRlcmJvbHQvdXNiNF9w
b3J0LmMNCkBAIC0xMCw2ICsxMCwyNyBAQA0KIA0KICNpbmNsdWRlICJ0Yi5oIg0KIA0KK3N0YXRp
YyBpbnQgY29ubmVjdG9yX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICpj
b25uZWN0b3IsIHZvaWQgKmRhdGEpDQorew0KKwlpbnQgcmV0Ow0KKw0KKwlyZXQgPSBzeXNmc19j
cmVhdGVfbGluaygmZGV2LT5rb2JqLCAmY29ubmVjdG9yLT5rb2JqLCAiY29ubmVjdG9yIik7DQor
CWlmIChyZXQpDQorCQlyZXR1cm4gcmV0Ow0KKw0KKwlyZXQgPSBzeXNmc19jcmVhdGVfbGluaygm
Y29ubmVjdG9yLT5rb2JqLCAmZGV2LT5rb2JqLCBkZXZfbmFtZShkZXYpKTsNCisJaWYgKHJldCkN
CisJCXN5c2ZzX3JlbW92ZV9saW5rKCZkZXYtPmtvYmosICJjb25uZWN0b3IiKTsNCisNCisJcmV0
dXJuIHJldDsNCit9DQorDQorc3RhdGljIHZvaWQgY29ubmVjdG9yX3VuYmluZChzdHJ1Y3QgZGV2
aWNlICpkZXYsIHN0cnVjdCBkZXZpY2UgKmNvbm5lY3Rvciwgdm9pZCAqZGF0YSkNCit7DQorCXN5
c2ZzX3JlbW92ZV9saW5rKCZjb25uZWN0b3ItPmtvYmosIGRldl9uYW1lKGRldikpOw0KKwlzeXNm
c19yZW1vdmVfbGluaygmZGV2LT5rb2JqLCAiY29ubmVjdG9yIik7DQorfQ0KKw0KIHN0YXRpYyBz
c2l6ZV90IGxpbmtfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2VfYXR0cmli
dXRlICphdHRyLA0KIAkJCSBjaGFyICpidWYpDQogew0KQEAgLTI1Myw2ICsyNzQsMTYgQEAgc3Ry
dWN0IHVzYjRfcG9ydCAqdXNiNF9wb3J0X2RldmljZV9hZGQoc3RydWN0IHRiX3BvcnQgKnBvcnQp
DQogCXBtX3J1bnRpbWVfbWFya19sYXN0X2J1c3koJnVzYjQtPmRldik7DQogCXBtX3J1bnRpbWVf
dXNlX2F1dG9zdXNwZW5kKCZ1c2I0LT5kZXYpOw0KIA0KKwl1c2I0LT5jb25uZWN0b3Jfb3BzLmJp
bmQgPSBjb25uZWN0b3JfYmluZDsNCisJdXNiNC0+Y29ubmVjdG9yX29wcy51bmJpbmQgPSBjb25u
ZWN0b3JfdW5iaW5kOw0KKw0KKwlyZXQgPSBjb21wb25lbnRfYWRkKCZ1c2I0LT5kZXYsICZ1c2I0
LT5jb25uZWN0b3Jfb3BzKTsNCisJaWYgKHJldCkgew0KKwkJZGV2X3dhcm4oJnVzYjQtPmRldiwg
ImZhaWxlZCB0byBhZGQgY29tcG9uZW50XG4iKTsNCisJCWRldmljZV91bnJlZ2lzdGVyKCZ1c2I0
LT5kZXYpOw0KKwkJcmV0dXJuIEVSUl9QVFIocmV0KTsNCisJfQ0KKw0KIAlyZXR1cm4gdXNiNDsN
CiB9DQogDQpAQCAtMjY1LDYgKzI5Niw3IEBAIHN0cnVjdCB1c2I0X3BvcnQgKnVzYjRfcG9ydF9k
ZXZpY2VfYWRkKHN0cnVjdCB0Yl9wb3J0ICpwb3J0KQ0KICAqLw0KIHZvaWQgdXNiNF9wb3J0X2Rl
dmljZV9yZW1vdmUoc3RydWN0IHVzYjRfcG9ydCAqdXNiNCkNCiB7DQorCWNvbXBvbmVudF9kZWwo
JnVzYjQtPmRldiwgJnVzYjQtPmNvbm5lY3Rvcl9vcHMpOw0KIAlkZXZpY2VfdW5yZWdpc3Rlcigm
dXNiNC0+ZGV2KTsNCiB9DQogDQo=
--000000000000629f8305dad33d48--
