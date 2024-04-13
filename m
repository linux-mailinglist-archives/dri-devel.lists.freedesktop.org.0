Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 175888A3BDB
	for <lists+dri-devel@lfdr.de>; Sat, 13 Apr 2024 11:09:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0700F10FB69;
	Sat, 13 Apr 2024 09:09:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 304 seconds by postgrey-1.36 at gabe;
 Sat, 13 Apr 2024 08:56:15 UTC
Received: from irl.hu (irl.hu [95.85.9.111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB5E10FA62;
 Sat, 13 Apr 2024 08:56:15 +0000 (UTC)
Received: from [192.168.2.4] (51b68488.dsl.pool.telekom.hu
 [::ffff:81.182.132.136]) (AUTH: CRAM-MD5 soyer@irl.hu, )
 by irl.hu with ESMTPSA
 id 000000000006F759.00000000661A477C.002702C7; Sat, 13 Apr 2024 10:51:08 +0200
Message-ID: <8b2aef9a51b97ca69cd5bc590f9fa535da5af4e4.camel@irl.hu>
Subject: Re: [PATCH] drm/amd: Only allow one entity to control ABM
From: Gergo Koteles <soyer@irl.hu>
To: harry.wentland@amd.com
Cc: Hamza.Mahfooz@amd.com, Sunpeng.Li@amd.com,
 amd-gfx@lists.freedesktop.org, ckoenig.leichtzumerken@gmail.com,
 dri-devel@lists.freedesktop.org, mario.limonciello@amd.com
Date: Sat, 13 Apr 2024 10:51:07 +0200
In-Reply-To: <20361f26-2c83-4619-8f9e-ec8788b8280f@amd.com>
Autocrypt: addr=soyer@irl.hu; prefer-encrypt=mutual;
 keydata=mDMEZgeDQBYJKwYBBAHaRw8BAQdAD5oxV6MHkjzSfQL2O8VsPW3rSUeCHfbx/a6Yfj3NUnS0HEdlcmdvIEtvdGVsZXMgPHNveWVyQGlybC5odT6ImQQTFgoAQRYhBLSYvEYEgjzzEMQCqgtEJzXf/1IRBQJmB4NAAhsDBQkFo5qABQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheAAAoJEAtEJzXf/1IRmdYA/0bE1BX7zOGKBgCa1DwzH2UHXawSKLpptADvI/ao6OOtAP4+wYgpR0kWR28lhmkRTpzG/+8GiMWsT60SV2bz9B7sCbg4BGYHg0ASCisGAQQBl1UBBQEBB0CPo8ow/E97WYtaek9EsLXvsvwpBsjWLq5mMOgJL/ukCwMBCAeIfgQYFgoAJhYhBLSYvEYEgjzzEMQCqgtEJzXf/1IRBQJmB4NAAhsMBQkFo5qAAAoJEAtEJzXf/1IRklEA/ipTfAI/onzNwZIp9sCdnt0bLhR5Oz8RD/FpbrJV1v7eAP0c/C6NQPDPWbQpobBR0pf1eTjWXjjr1fj2jxSvWbMRCw==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 13 Apr 2024 09:09:34 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi>=20

> ABM will reduce the backlight and compensate by adjusting brightness and =
contrast of the image. It has 5 levels: 0, 1, 2, 3, 4. 0 means off. 4 means=
 maximum backlight reduction. IMO, 1 and 2 look okay. 3 and 4 can be quite =
impactful, both to power and visual fidelity.

I tried this with 6.9 and it looks weird with an OLED panel used with
dark UI settings.
The dark is no longer dark, everything is brighter.
I turned this feature off with amdgpu.abmlevel=3D0.

Best regards,
Gergo

