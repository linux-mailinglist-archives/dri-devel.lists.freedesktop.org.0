Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1042074C5
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 15:43:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD0406EB53;
	Wed, 24 Jun 2020 13:43:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BACF6EB56
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 13:43:14 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200624134312euoutp025fbd5471a24361084f6bc65d1131089c~bfrEnnH7f3261232612euoutp02g
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 13:43:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200624134312euoutp025fbd5471a24361084f6bc65d1131089c~bfrEnnH7f3261232612euoutp02g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1593006192;
 bh=1Io7wSo83WPjxHhYBZCiAe5MfAP9wHAkxGALQivFhUk=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=PIFEWFhd0q1WgqTiV44PhpwHmVJEaoPeGKsX2WMErrrhmVcF6d18lhcDKFAe3cXer
 UP3B7/R17BZ2YWYSR243jVFQ2oLN6ZhocHVUEUbcfNGZeg004e8okStTc+qTeN7EqV
 0UR1Y6UJOX5Vs1nhEKjQ1eqgytLvje9TfRqVk/XA=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200624134312eucas1p24d05bf761c9d8b55983a7d963d40d4f7~bfrEJINos1063610636eucas1p2N;
 Wed, 24 Jun 2020 13:43:12 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id C4.92.05997.F6853FE5; Wed, 24
 Jun 2020 14:43:11 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200624134311eucas1p1dd22f5d38d9bdc5ea09fd02218d598c8~bfrDxUA3F1154411544eucas1p1J;
 Wed, 24 Jun 2020 13:43:11 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200624134311eusmtrp200cf35232ab5b227b8a3fc5618689630~bfrDwnZWK0905109051eusmtrp2U;
 Wed, 24 Jun 2020 13:43:11 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-10-5ef3586fc9f5
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 25.47.06314.F6853FE5; Wed, 24
 Jun 2020 14:43:11 +0100 (BST)
Received: from [106.210.85.205] (unknown [106.210.85.205]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200624134310eusmtip1296c16b6e5fd5f1984c313265cf11a2d~bfrC5K42Q0132801328eusmtip1z;
 Wed, 24 Jun 2020 13:43:10 +0000 (GMT)
Subject: Re: [RESEND PATCH v5 4/5] drm/bridge/sii8620: fix resource
 acquisition error handling
To: Mark Brown <broonie@kernel.org>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <cf95aac3-fef5-29d0-d94e-ce6cce4ccdb4@samsung.com>
Date: Wed, 24 Jun 2020 15:43:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200624132532.GC5472@sirena.org.uk>
Content-Language: pl
X-Brightmail-Tracker: H4sIAAAAAAAAA22SfVAMcRjH53e7t7ula9aVuWe8TmeMYVQoM2ukCNP6I+9jGi/V0U5R15lb
 RRkk0RVS6aQwTMpLoylH6SJxqA4RrpRhTi5GTTkUTRS62zX84b/Pfp/v93n2u7MUJr9LjKW2
 xG/ntPGqOCXhilfVDz7x1oT1hc88njGX6cq+i5grJ8qljL6jk2AsX+0Es/9cOcG0DHRhjLmn
 BWcycopJxmBrlTLPa04RjElfi5iye69JxpS1njndr8cWuLPPW59irL3tAMkaC1+T7EldgZQ1
 lGYQbGP2Mwlbd/oyyVoPNUjYq8V72axrpYi9feQYzvYZJq5wW+caEMXFbUnktL6Bka4xKeWr
 tzUa0E5zd3AK0l1CmciFAtofqs05eCZypeT0RQTN1bmY8NCPoPL9fnHShyDzSfpIhHJGbN/c
 Bf0Cgn1FzWLCjsCS1+7c60FHgt6WQjjYk54MLQO1zk0YXY/Du6d20jEg6GkwfLXdaZLRgWAZ
 SnUyTk+BHxXpuIPH0BvhsLUbEzyjwVzQ6dRd6NlwWGckHW+E0WvBPODnkDHaE9repiHHLaAv
 UdCbm48JRRfDYMcjicAe0N1wjRR4PPwynhH1vWC9mIYJYd1I/wqjGJ4Hrx5/JwReCHknXoqf
 wh3aekcLh90ht8pxyyHLQHdQLri9wNpUKW5RQEnzV3ELC0XXdZJs5FX4T7PCv20K/2kj8EIY
 spmkAk+C672nMIFj4dmFj6LHF168sv7Ho4A6y0GRvSDvUAcp8FR4cLMYO4tGlSIFl8Crozl+
 djy3w4dXqfmE+GifzRq1AY382g9/NvRXo5qhTSZEU0jpJqt48zlcLlUl8klqEwIKU3rKgpse
 hstlUaqkZE6ridAmxHG8CY2jcKVC5lfUtVFOR6u2c7Ect43T/plKKJexKahkouKGS2ng/Q3L
 I1rJYmYU7V8T6jfXGLrLvjUgMWSqd0nPh9SYZMu4o+qkrCs1a1GZzx5iwxKPF2Vh81O9OweD
 CjQ8FarPz1XMHH5EcgpJyKqAito1K7sCNLfq0zP8l21e53tm8e6gHw3tn2RNj7+cZ+dMuDNr
 kaoobKnlxgxb8A4lzseoZk3HtLzqN7VF97rWAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBKsWRmVeSWpSXmKPExsVy+t/xu7r5EZ/jDLY8V7J4OeEwo8XGGetZ
 LaY+fMJmceXrezaL5sXr2Syufn/JbHHyzVUWi86JS9gtNj2+xmpxedccNotDU/cyWqw9cpfd
 4lBftMXcL1OZHfg8Ll+7yOzx/kYru8fOWXfZPWZ3zGT12LSqk83jxIRLTB77565h97jffZzJ
 Y/OSeo++LasYPQ70Tmbx+LxJLoAnSs+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbK
 yFRJ384mJTUnsyy1SN8uQS9j3enigjXyFe+mfGRvYPwi2cXIwSEhYCLx+BtfFyMXh5DAUkaJ
 j90dzF2MnEBxcYnd899C2cISf651sYHYQgJvGSXW/tUDsYUFEiSmPm4Ai4sIKEtc/b6XBWQQ
 s8AZFokL7xawQUx9yCjR3r4SrIpNQFPi7+abYDavgJ3ElT9NYDaLgKrE7w3tLCC2qECsRPfi
 H+wQNYISJ2c+AYtzChhJ9HTsBIszC4RJdB1YDmWLSNx41MI4gVFwFpKWWUjKZiEpg7BtJe7M
 3c0MYctLbH87B8rWlVi0bQU7svgCRvZVjCKppcW56bnFhnrFibnFpXnpesn5uZsYgali27Gf
 m3cwXtoYfIhRgINRiYd3w4OPcUKsiWXFlbmHGCU4mJVEeJ3Ono4T4k1JrKxKLcqPLyrNSS0+
 xGgK9PREZinR5HxgGssriTc0NTS3sDQ0NzY3NrNQEuftEDgYIySQnliSmp2aWpBaBNPHxMEp
 1cA45562oG5o6ZxXh/dkXotoU1XmOqT9/m3yp8f9S99/SfHfpbr3TdC1nnNrlBjOOD/iFguc
 zdJt/noOz571BSq7a2e03BRes+yKsvT36297Pae9uGK+zVtlYuOzmfvNC6KKeR7r3aznZG7N
 n10/q/xm817ZY0vmsWtrcVS/yv5nttI5l2GZjsw5JZbijERDLeai4kQACk88bisDAAA=
X-CMS-MailID: 20200624134311eucas1p1dd22f5d38d9bdc5ea09fd02218d598c8
X-Msg-Generator: CA
X-RootMTR: 20200624114137eucas1p13599d33a0c4a9abf7708bf8c8e77264b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200624114137eucas1p13599d33a0c4a9abf7708bf8c8e77264b
References: <20200624114127.3016-1-a.hajda@samsung.com>
 <CGME20200624114137eucas1p13599d33a0c4a9abf7708bf8c8e77264b@eucas1p1.samsung.com>
 <20200624114127.3016-5-a.hajda@samsung.com>
 <20200624132532.GC5472@sirena.org.uk>
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
Cc: andy.shevchenko@gmail.com, Jernej Skrabec <jernej.skrabec@siol.net>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: multipart/mixed; boundary="===============1244822803=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============1244822803==
Content-Type: multipart/alternative;
	boundary="------------C7126BAFE6F780FB493E874D"
Content-Language: pl

This is a multi-part message in MIME format.
--------------C7126BAFE6F780FB493E874D
Content-Type: text/plain; charset="windows-1252"; format="flowed"
Content-Transfer-Encoding: 7bit


On 24.06.2020 15:25, Mark Brown wrote:
> On Wed, Jun 24, 2020 at 01:41:26PM +0200, Andrzej Hajda wrote:
>> In case of error during resource acquisition driver should print error
>> message only in case it is not deferred probe, using probe_err helper
>> solves the issue. Moreover it records defer probe reason for debugging.
> If we silently ignore all deferred probe errors we make it hard for
> anyone who is experiencing issues with deferred probe to figure out what
> they're missing.  We should at least be logging problems at debug level
> so there's something for people to go on without having to hack the
> kernel source.


But you can always do:

cat /sys/kernel/debug/devices_deferred

And you will find there deferred probe reason (thanks to patch 2/5).

Eventually if you want it in dmesg anyway, one can adjust probe_err 
function to log probe error on debug level as well.


Regards

Andrzej


>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://protect2.fireeye.com/url?k=ef34cf7b-b2ff4845-ef354434-0cc47a31309a-305676031d9eb553&q=1&u=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel

--------------C7126BAFE6F780FB493E874D
Content-Type: multipart/related;
	boundary="----VoKAcCxv_aBdAWK_fBHSqgSbPht4UGuM4ckiQRNO0n1BiNBx=_109d2f_"

------VoKAcCxv_aBdAWK_fBHSqgSbPht4UGuM4ckiQRNO0n1BiNBx=_109d2f_
Content-Type: text/html; charset="windows-1252"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 24.06.2020 15:25, Mark Brown wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20200624132532.GC5472@sirena.org.uk">
      <pre class="moz-quote-pre" wrap="">On Wed, Jun 24, 2020 at 01:41:26PM +0200, Andrzej Hajda wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">In case of error during resource acquisition driver should print error
message only in case it is not deferred probe, using probe_err helper
solves the issue. Moreover it records defer probe reason for debugging.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
If we silently ignore all deferred probe errors we make it hard for
anyone who is experiencing issues with deferred probe to figure out what
they're missing.  We should at least be logging problems at debug level
so there's something for people to go on without having to hack the
kernel source.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>But you can always do:</p>
    <p>cat /sys/kernel/debug/devices_deferred</p>
    <p>And you will find there deferred probe reason (thanks to patch
      2/5).</p>
    <p>Eventually if you want it in dmesg anyway, one can adjust
      probe_err function to log probe error on debug level as well.</p>
    <p><br>
    </p>
    <p>Regards</p>
    <p>Andrzej<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:20200624132532.GC5472@sirena.org.uk">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">_______________________________________________
dri-devel mailing list
<a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>
<a class="moz-txt-link-freetext" href="https://protect2.fireeye.com/url?k=ef34cf7b-b2ff4845-ef354434-0cc47a31309a-305676031d9eb553&amp;q=1&amp;u=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel">https://protect2.fireeye.com/url?k=ef34cf7b-b2ff4845-ef354434-0cc47a31309a-305676031d9eb553&amp;q=1&amp;u=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel</a>
</pre>
    </blockquote>
  <table id=bannersignimg data-cui-lock="true" namo_lock><tr><td><p>&nbsp;</p>
</td></tr></table><table id=confidentialsignimg data-cui-lock="true" namo_lock><tr><td><p>&nbsp;<img style="border: 0px solid currentColor; border-image: none; width: 520px; height: 144px; display: inline-block;" unselectable="on" data-cui-image="true" src="cid:cafe_image_0@s-core.co.kr">&nbsp;</p>
</td></tr></table></body>
</html>
<img src='http://ext.w1.samsung.net/mail/ext/v1/external/status/update?userid=a.hajda&do=bWFpbElEPTIwMjAwNjI0MTM0MzExZXVjYXMxcDFkZDIyZjVkMzhkOWJkYzVlYTA5ZmQwMjIxOGQ1OThjOCZyZWNpcGllbnRBZGRyZXNzPWRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc_' border=0 width=0 height=0 style='display:none'>
------VoKAcCxv_aBdAWK_fBHSqgSbPht4UGuM4ckiQRNO0n1BiNBx=_109d2f_
Content-Type: image/gif
Content-Transfer-Encoding: base64
Content-ID: <cafe_image_0@s-core.co.kr>

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
Ow==


------VoKAcCxv_aBdAWK_fBHSqgSbPht4UGuM4ckiQRNO0n1BiNBx=_109d2f_--

--------------C7126BAFE6F780FB493E874D--

--===============1244822803==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1244822803==--
