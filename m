Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E599B114FC1
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 12:26:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B205C6F9D9;
	Fri,  6 Dec 2019 11:26:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb3-smtp-cloud7.xs4all.net (lb3-smtp-cloud7.xs4all.net
 [194.109.24.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ACFF6F9D9
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 11:26:18 +0000 (UTC)
Received: from [192.168.2.10] ([82.164.86.234])
 by smtp-cloud7.xs4all.net with ESMTPA
 id dBkOidZotU9wBdBkRi16PZ; Fri, 06 Dec 2019 12:26:14 +0100
To: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] drm/Kconfig: add missing 'depends on DRM' for DRM_DP_CEC
Message-ID: <489bdaae-9b05-2d70-12e1-4fda7899dfc1@xs4all.nl>
Date: Fri, 6 Dec 2019 12:26:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
X-CMAE-Envelope: MS4wfFh5ml02Rn9H1tnBYK3P+mBmqyl1VoFSv4YIDM+MdUPd698LB4JOYzMZWuEqBjufU75R1xzHUj43K9TK+FMsIQle3wLJTaKFGBsWyRFRtRPo7OpVvOhZ
 ZqGS4WtBMGCi3lo//cAqQVYANl4pbjY6xyEfa0d3N26wr9VjQ64Efwgm6t/zkDpQ07RAzsfSsBndxBaHwANBtmNTKwBEcGiXYludmibTc7AiBOETzmnPlOHv
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xs4all.nl; s=s1; 
 t=1575631574; bh=NyTQK/xCUzmCnYiy31ummh54q3iWHq/KGxvmuWlpkk4=;
 h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=ntmqAC3/Uhi5qI/IqOZQS4+jfAXYxNVDJeMGCwP9MjHk746585cK/WlBb+nHoazWk
 2no352hzdHR52idnEBloNGNNG9ZeRZII49idEMY3ekfS6QaZhTCnJuX71rvVz21Zqe
 VNW/yPBQ5kRNd+zwx+eKXEF+LEDdEcvg8ft6gGOo6FYw3qE8YPnvESNgiGlOJyjKqs
 D4ULbMoGqnO2n9Gk93xAw3RsEensOO0hRbQ7oKQY09HkXbS/h4toTNG4F/Q2zycygv
 S/yzzyM1ddQbBmOaa4//tS/54KGMAdtr7us7d0s3LBgwWmUT09C9O2bbxvxlzXMX/O
 cYeHTB6UxvqGg==
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
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGEgbWlzc2luZyAnZGVwZW5kcyBvbiBEUk0nIGZvciB0aGUgRFJNX0RQX0NFQyBjb25maWcK
b3B0aW9uLiBXaXRob3V0IHRoYXQgZW5hYmxpbmcgRFJNX0RQX0NFQyB3aWxsIGZvcmNlIENFQ19D
T1JFCnRvID15IGluc3RlYWQgb2YgPW0gaWYgRFJNPW0gYXMgd2VsbC4KClNpZ25lZC1vZmYtYnk6
IEhhbnMgVmVya3VpbCA8aHZlcmt1aWwtY2lzY29AeHM0YWxsLm5sPgotLS0KZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL0tjb25maWcKaW5kZXgg
MTE2ODM1MTI2N2ZkLi5lOGU0NzhkNmRhOWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9L
Y29uZmlnCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9LY29uZmlnCkBAIC0xNjMsNiArMTYzLDcgQEAg
Y29uZmlnIERSTV9MT0FEX0VESURfRklSTVdBUkUKCiBjb25maWcgRFJNX0RQX0NFQwogCWJvb2wg
IkVuYWJsZSBEaXNwbGF5UG9ydCBDRUMtVHVubmVsaW5nLW92ZXItQVVYIEhETUkgc3VwcG9ydCIK
KwlkZXBlbmRzIG9uIERSTQogCXNlbGVjdCBDRUNfQ09SRQogCWhlbHAKIAkgIENob29zZSB0aGlz
IG9wdGlvbiBpZiB5b3Ugd2FudCB0byBlbmFibGUgSERNSSBDRUMgc3VwcG9ydCBmb3IKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
