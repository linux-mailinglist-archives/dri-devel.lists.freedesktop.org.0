Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D97B0A006
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 11:47:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 758A910E339;
	Fri, 18 Jul 2025 09:47:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=robert.mader@collabora.com header.b="XDQCh9ks";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E40810E941
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 09:47:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1752832024; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=XboJuV81rEj0JQ3PfzZFkJgSBQwuIA8PgyawCSFgXwh4BXWa0ZAdyeePsIafZMly821WsIgh91+dBJWhMurJ0ivpPhKfDm+i8YMwdtaq1UjHkRvH2/hM6skWkz1JMFM9NhA3/TEH+YCYRdD1UezCfttOYcXotYHuwO4MeEBs47E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1752832024;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=JA79SFGCqALxsS0OqnrqTVYc8CF4TMuJhfSpOPOMgpM=; 
 b=JhrSwR/LRfc+5XCkDz7iA8Fkz6EngodT4KWau4IjQ6/VZLfLY8RVvilZooqZ/dMWkgzbqLhqISLf2xCrEnIOk10dA0/iUZZSr+PF7Qp1Hd2lmxLD6k69nJ0/VQNsSUH769gw6ztvLqDRp8MbqFTTT2n+TbXAU/luh7f9WjHf1/A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=robert.mader@collabora.com;
 dmarc=pass header.from=<robert.mader@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752832024; 
 s=zohomail; d=collabora.com; i=robert.mader@collabora.com;
 h=Content-Type:Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Message-Id:Reply-To;
 bh=JA79SFGCqALxsS0OqnrqTVYc8CF4TMuJhfSpOPOMgpM=;
 b=XDQCh9ksc9/HDoN+vcJvOL6kbA0q0uBkxrJbQI6+eoq6H/E7qQPr5FTs4/Ljx0af
 NhC1UfDUF2HIdsVrMFwWgnPv1pDYg5ySxpMsMlKD+FhAESZLziznIfedCTaaOyr3zQc
 4MBC/Pc+53qalR1p8l6gQFQB3HwtJoKgmNZrJ5/o=
Received: by mx.zohomail.com with SMTPS id 1752832022334678.381179197415;
 Fri, 18 Jul 2025 02:47:02 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------r0eWxL2eulaegJTEQtIXSVMm"
Message-ID: <2163dd96-0542-4a39-8d7e-36f6bd357fa2@collabora.com>
Date: Fri, 18 Jul 2025 11:46:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/vkms: Add writeback encoders as possible clones
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org
References: <20250703090335.23595-1-robert.mader@collabora.com>
 <27oxphsevfwolf5mpm2vygrmp6wryujwmw65lsb7eqktykdw3z@lahceblqorgn>
Content-Language: en-US, de-DE
From: Robert Mader <robert.mader@collabora.com>
In-Reply-To: <27oxphsevfwolf5mpm2vygrmp6wryujwmw65lsb7eqktykdw3z@lahceblqorgn>
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

This is a multi-part message in MIME format.
--------------r0eWxL2eulaegJTEQtIXSVMm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks for the feedback!

On 06.07.25 13:29, Dmitry Baryshkov wrote:
> On Thu, Jul 03, 2025 at 11:03:35AM +0200, Robert Mader wrote:
>> Since commit 41b4b11da0215 ("drm: Add valid clones check") setting
>> the `possible_clones` values is a hard requirement for cloning.
>> `vkms` supports cloning for writeback connectors in order to capture
>> CRTC content, however that broke with said commit.
>>
>> Writeback connectors are created on a per-CRTC basis, thus mark
>> every non-writeback connector that is compatible with a given CRTC
>> as possible clone - and vice-versa.
>>
>> Using a default configuration, the corresponding `drm_info` output
>> changes from:
> It feels like the current possible_clones is incorrect according to the
> documentation. Should there be a Fixes tag?

The issue is that possible_clones was never explicitly set, making it 
fall back to the default value - every encoder only being compatible 
with itself. So candidates for a Fixes tag would be either the initial 
implementation of the writeback connector in vkms - or the commit that 
started enforcing correct values ("drm: Add valid clones check") as 
previously the values where simply ignored.

Unfortunately the patch is not easily backportable either way because of 
the changes in https://patchwork.freedesktop.org/series/144091/#rev4 
that recently landed - i.e. 6.15 would need a completely rewritten fix, 
and previous kernels don't really need it.

Thus I'd rather leave it out if that's ok with you?

>>
>> Signed-off-by: Robert Mader<robert.mader@collabora.com>
>> ---
>>   drivers/gpu/drm/vkms/vkms_output.c    | 12 ++++++++++++
>>   drivers/gpu/drm/vkms/vkms_writeback.c |  2 ++
>>   2 files changed, 14 insertions(+)
>>
-- 
Robert Mader
Consultant Software Developer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

--------------r0eWxL2eulaegJTEQtIXSVMm
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Thanks for the feedback!<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 06.07.25 13:29, Dmitry Baryshkov
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:27oxphsevfwolf5mpm2vygrmp6wryujwmw65lsb7eqktykdw3z@lahceblqorgn">
      <pre wrap="" class="moz-quote-pre">On Thu, Jul 03, 2025 at 11:03:35AM +0200, Robert Mader wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Since commit 41b4b11da0215 ("drm: Add valid clones check") setting
the `possible_clones` values is a hard requirement for cloning.
`vkms` supports cloning for writeback connectors in order to capture
CRTC content, however that broke with said commit.

Writeback connectors are created on a per-CRTC basis, thus mark
every non-writeback connector that is compatible with a given CRTC
as possible clone - and vice-versa.

Using a default configuration, the corresponding `drm_info` output
changes from:
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
It feels like the current possible_clones is incorrect according to the
documentation. Should there be a Fixes tag?</pre>
    </blockquote>
    <span style="white-space: pre-wrap">
</span>
    <p>The issue is that possible_clones was never explicitly set,
      making it fall back to the default value - every encoder only
      being compatible with itself. So candidates for a Fixes tag would
      be either the initial implementation of the writeback connector in
      vkms - or the commit that started enforcing correct values ("drm:
      Add valid clones check") as previously the values where simply
      ignored.</p>
    <p>Unfortunately the patch is not easily backportable either way
      because of the changes in
      <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/series/144091/#rev4">https://patchwork.freedesktop.org/series/144091/#rev4</a> that
      recently landed - i.e. 6.15 would need a completely rewritten fix,
      and previous kernels don't really need it.</p>
    <p>Thus I'd rather leave it out if that's ok with you?<br>
    </p>
    <blockquote type="cite"
cite="mid:27oxphsevfwolf5mpm2vygrmp6wryujwmw65lsb7eqktykdw3z@lahceblqorgn">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">

Signed-off-by: Robert Mader <a class="moz-txt-link-rfc2396E" href="mailto:robert.mader@collabora.com">&lt;robert.mader@collabora.com&gt;</a>
---
 drivers/gpu/drm/vkms/vkms_output.c    | 12 ++++++++++++
 drivers/gpu/drm/vkms/vkms_writeback.c |  2 ++
 2 files changed, 14 insertions(+)

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
    <pre class="moz-signature" cols="72">-- 
Robert Mader
Consultant Software Developer 

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England &amp; Wales, no. 5513718</pre>
  </body>
</html>

--------------r0eWxL2eulaegJTEQtIXSVMm--
