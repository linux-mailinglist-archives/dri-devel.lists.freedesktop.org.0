Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 410756ACE2
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 18:36:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66A916E14D;
	Tue, 16 Jul 2019 16:36:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00EAC6E14D
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 16:36:36 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 45DD980330;
 Tue, 16 Jul 2019 18:36:32 +0200 (CEST)
Date: Tue, 16 Jul 2019 18:36:29 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH v2 08/19] drm/udl: drop use of drmP.h
Message-ID: <20190716163629.GA18689@ravnborg.org>
References: <20190716064220.18157-1-sam@ravnborg.org>
 <20190716064220.18157-9-sam@ravnborg.org>
 <CADnq5_M=fZUarEA9VanryORZkwc6YnEwZpKDHMqpU2o9CYTa=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_M=fZUarEA9VanryORZkwc6YnEwZpKDHMqpU2o9CYTa=Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=7gkXJVJtAAAA:8
 a=QX4gbG5DAAAA:8 a=QyXUC8HyAAAA:8 a=cm27Pg_UAAAA:8 a=DBfv99YmAAAA:8
 a=zd2uoN0lAAAA:8 a=SJz97ENfAAAA:8 a=-VAfIpHNAAAA:8 a=20KFwNOVAAAA:8
 a=jIQo8A4GAAAA:8 a=VojHr-DLmUXDALwOWMUA:9 a=wPNLvfGTeEIA:10
 a=E9Po1WZjFZOl8hwRPBS3:22 a=AbAUZ8qAyYyZVLSsDulk:22
 a=xmb-EsYY8bH0VWELuYED:22 a=c73wXdw0ADZYY2z2LwuN:22
 a=vFet0B0WnEQeilDPIY6i:22 a=srlwD-8ojaedGGhPAyx8:22
 a=Lf5xNeLK5dgiOs8hzIjU:22
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
Cc: Robert Tarasov <tutankhamen@chromium.org>,
 Emil Lundmark <lndmrk@chromium.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@intel.com>, Mikulas Patocka <mpatocka@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQWxleC4KCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJv
cmcub3JnPgo+ID4gQWNrZWQtYnk6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9y
YS5jb20+Cj4gPiBDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+Cj4gPiBDYzogRGF2aWQg
QWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBm
ZndsbC5jaD4KPiA+IENjOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgo+ID4g
Q2M6IFJvYmVydCBUYXJhc292IDx0dXRhbmtoYW1lbkBjaHJvbWl1bS5vcmc+Cj4gPiBDYzogT2xl
a3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgo+
ID4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiA+IENjOiBU
aG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPiA+IENjOiAiTm9yYWxmIFRy
w7hubmVzIiA8bm9yYWxmQHRyb25uZXMub3JnPgo+ID4gQ2M6IEVyaWMgQW5ob2x0IDxlcmljQGFu
aG9sdC5uZXQ+Cj4gPiBDYzogTWlrdWxhcyBQYXRvY2thIDxtcGF0b2NrYUByZWRoYXQuY29tPgo+
ID4gQ2M6IEVtaWwgTHVuZG1hcmsgPGxuZG1ya0BjaHJvbWl1bS5vcmc+Cj4gPiBDYzogRXVnZW5p
eSBQYWx0c2V2IDxFdWdlbml5LlBhbHRzZXZAc3lub3BzeXMuY29tPgo+IAo+IFJldmlld2VkLWJ5
OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CgpUaGFua3MgZm9yIGFs
bCB5b3VyIHJldmlld3MgLSBhcHByZWNpYXRlZCEKCglTYW0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
