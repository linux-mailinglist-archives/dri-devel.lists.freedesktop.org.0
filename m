Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CF82F8CF0
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jan 2021 11:45:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A73506E58E;
	Sat, 16 Jan 2021 10:44:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from comms.puri.sm (comms.puri.sm [159.203.221.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 413EE6E4EA
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jan 2021 06:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by comms.puri.sm (Postfix) with ESMTP id 9C8AAE01BD;
 Fri, 15 Jan 2021 22:41:40 -0800 (PST)
Received: from comms.puri.sm ([127.0.0.1])
 by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i2thfZY25I2n; Fri, 15 Jan 2021 22:41:39 -0800 (PST)
Date: Sat, 16 Jan 2021 07:41:37 +0100
In-Reply-To: <YAIWSr46dqZpYAat@pendragon.ideasonboard.com>
References: <20201007012438.27970-2-laurent.pinchart@ideasonboard.com>
 <20210115075918.26407-1-martin.kepplinger@puri.sm>
 <YAIWSr46dqZpYAat@pendragon.ideasonboard.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: display: mxsfb: Convert binding to
 YAML
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From: Martin Kepplinger <martin.kepplinger@puri.sm>
Message-ID: <AEF0DD5A-AB4B-4787-981A-02728F63AB9A@puri.sm>
X-Mailman-Approved-At: Sat, 16 Jan 2021 10:44:40 +0000
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
Cc: marex@denx.de, devicetree@vger.kernel.org, agx@sigxcpu.org,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpBbSAxNS4gSsOkbm5lciAyMDIxIDIzOjI1OjE0IE1FWiBzY2hyaWViIExhdXJlbnQgUGluY2hh
cnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT46Cj5IaSBNYXJ0aW4sCj4KPk9u
IEZyaSwgSmFuIDE1LCAyMDIxIGF0IDA4OjU5OjE4QU0gKzAxMDAsIE1hcnRpbiBLZXBwbGluZ2Vy
IHdyb3RlOgo+PiBoaSBMYXVyZW50LAo+PiAKPj4gRG8geW91IG1pbmQgbWUgYWRkaW5nIGEgRFQg
cHJvcGVydHkgaW4gdGhlIG9sZCBmb3JtYXQgbm93PyBJZiBzbywgSSdkCj4+IGFwcHJlY2lhdGVk
IGFuIGFjayBpbiB0aGlzIHRocmVhZDoKPj4KPmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4
LWFybS1rZXJuZWwvMjAyMDEyMDExMzQ2MzguR0EzMDU3MzRAYm9nb24ubS5zaWd4Y3B1Lm9yZy8K
Pj4gCj4+IElmIGl0IGNhdXNlcyBleHRyYSB3b3JrIGZvciB5b3UgYW5kIHdhbnQgdG8gcmVzZW5k
IHlvdXIgc2VyaWVzIHNvb24sCj5JJ2xsCj4+IGdsYWRseSBkZWxheSB0aGVtIGZvciBsYXRlci4K
Pgo+SSB0aGluayB0aGUgY29udmVyc2lvbiBvdCBZQU1MIGlzIHJlYWR5LiBJJ3ZlIHNwbGl0IGl0
IGZyb20gdGhlIHJlc3Qgb2YKPm15IHNlcmllcywgYW5kIHBvc3RlZCBhIHYzLCBhc2tpbmcgUm9i
IHRvIG1lcmdlIGl0LiBXb3VsZCB5b3UgbWluZAo+cmViYXNpbmcgdGhlIGFkZGl0aW9uIG9mIHRo
ZSBuZXcgcHJvcGVydGllcyBvbiB0b3AgPwoKCkhpIExhdXJlbnQsCgp0aGFua3MgZm9yIHRoZSB0
aW1lbHkgYW5zd2VyLiBzb3VuZHMgZ29vZDsgSSdsbCByZWJhc2UuCgogICAgICAgICAgICAgICAg
IG1hcnRpbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
