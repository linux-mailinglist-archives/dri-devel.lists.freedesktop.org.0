Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E47E1CF3DE
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 09:30:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D82EC89E59;
	Tue,  8 Oct 2019 07:30:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFF0C89E59
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 07:30:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Oct 2019 00:30:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,270,1566889200"; d="scan'208";a="206589535"
Received: from wpross-mobl.ger.corp.intel.com (HELO localhost) ([10.252.55.86])
 by fmsmga001.fm.intel.com with ESMTP; 08 Oct 2019 00:30:35 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1 2/2] drm: delete drmP.h + drm_os_linux.h
In-Reply-To: <20191007171224.1581-3-sam@ravnborg.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191007171224.1581-1-sam@ravnborg.org>
 <20191007171224.1581-3-sam@ravnborg.org>
Date: Tue, 08 Oct 2019 10:31:15 +0300
Message-ID: <87h84jd77g.fsf@intel.com>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 Maxime Ripard <mripard@kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Dariusz Marcinkiewicz <darekm@google.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAwNyBPY3QgMjAxOSwgU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPiB3cm90
ZToKPiBUaGVyZSBpcyBmaW5hbGx5IG5vIG1vcmUgdXNlcnMgbGVmdCBpbiB0aGUga2VybmVsIG9m
IGRybVAuaAo+IGFuZCBkcm1fb3NfbGludXguaCAoZHJtUC5oIHdhcyB0aGUgb25seSB1c2VyIGxl
ZnQpLgo+IERlbGV0ZSB0aGUgaGVhZGVyIGZpbGVzIGFuZCBkZWxldGUgdGhlIGNvcnJlc3BvbmRp
bmcgdG9kbyBlbnRyeS4KPgo+IFdoZW4gd2Ugc3RhcnRlZCB0aGlzIHF1ZXN0IHRoZXJlIHdhcyBt
b3JlIHRoYW4gNzAwIHVzZXJzIG9mIGRybVAuaC4KPiBBbmQgZHJtUC5oIHdhcyBhIGh1Z2UgY292
ZXItaXQtYWxsIGhlYWRlciBmaWxlLgoKR29vZCBqb2IsIGFuZCB0aGFua3MgZm9yIHlvdXIgcGVy
c2lzdGVuY2UhCgpCUiwKSmFuaS4KCgotLSAKSmFuaSBOaWt1bGEsIEludGVsIE9wZW4gU291cmNl
IEdyYXBoaWNzIENlbnRlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
