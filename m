Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B186EB9B6
	for <lists+dri-devel@lfdr.de>; Sat, 22 Apr 2023 16:45:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C1AE10E2B9;
	Sat, 22 Apr 2023 14:45:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 367 seconds by postgrey-1.36 at gabe;
 Fri, 21 Apr 2023 18:38:26 UTC
Received: from out-53.mta1.migadu.com (out-53.mta1.migadu.com [95.215.58.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 200F410EEBE
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 18:38:25 +0000 (UTC)
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1682101936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uqYeX2aBmdkBzAWr+UB3hayRraxOs8lPFg59w2CNeVo=;
 b=WJBeMck123/k/KlRkqace/tptWT6sToqwwkOZww3bMDPcmzdHWZdqtE8O5MAJgtNYFtER3
 lbIBsZkDNvGg7OmiRCNyZ4kIag0Z9rFa4VnGYYTqwGu18kP/CY1SdP5+qKUZuj71owfEhb
 0F/0SrxyEyhbcbQr4w/O8FYs1OHVgEY=
Date: Fri, 21 Apr 2023 18:32:15 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: "Konstantin Ryabitsev" <konstantin.ryabitsev@linux.dev>
Message-ID: <4d4471f957af144d7a0f22a2147d90f9@linux.dev>
Subject: Re: [PATCH RESEND v2 1/2] dt-bindings: display: simple: add
 support for InnoLux G070ACE-L01
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>, "Doug
 Anderson" <dianders@chromium.org>
In-Reply-To: <2d7d8462-4e75-bbd2-4ae5-6403eda43020@linaro.org>
References: <2d7d8462-4e75-bbd2-4ae5-6403eda43020@linaro.org>
 <20230201-innolux-g070ace-v2-0-2371e251dd40@skidata.com>
 <20230201-innolux-g070ace-v2-1-2371e251dd40@skidata.com>
 <CAD=FV=XJCtqep+92h3gLfs4o2TwvL4MORjc9ydTSpZiZ0dsR0w@mail.gmail.com>
 <fb93e95f-181f-917d-9216-a81dec1a2959@linaro.org>
 <CAD=FV=Vs8UEfBZ56fYb3i1cmFbCSPrbgaedXB4+UvDTOyhzCzw@mail.gmail.com>
 <184f0a80-34bc-5ebf-58bb-82a310eb91f6@linaro.org>
 <CAD=FV=WLHpddAMo7GQwj98TtDn0xw6UzgYUKyVhSDZw1acKpCg@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Sat, 22 Apr 2023 14:45:29 +0000
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
Cc: devicetree@vger.kernel.org, richard.leitner@linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org, Rob
 Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, Richard
 Leitner <richard.leitner@skidata.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

April 21, 2023 1:01 PM, "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro=
.org> wrote:=0A>> Ah, got it. So I guess from the perspective of "b4" eve=
ry time the=0A>> author modifies a patch (like adding new tags to it) the=
n it's a new=0A>> application of Signed-off-by and thus the old Signed-of=
f-by is removed=0A>> from the top and a new one is added below all the ta=
gs that have been=0A>> received. Thus if b4 grabs all the tags off the ma=
iling list for=0A>> applying it ends up in a different order than if it g=
rabs all the tags=0A>> off the mailing list for sending a new version.=0A=
>> =0A>> OK, I can understand that perspective. I'll keep it in mind.=0A>=
 =0A> Yeah. I actually agree with your point that submitter's SoB should=
=0A> always be the last one, but I agree more with using process via=0A> =
standardized tools. IOW, since I cannot change in this matter b4, I need=
=0A> to agree with it. :)=0A=0AFWIW, everyone disagrees on how it should =
be done (which is a totally normal state of things). B4 uses the "chain o=
f custody" logic when it comes to trailers, described here:=0A=0Ahttps://=
lore.kernel.org/tools/20221031165842.vxr4kp6h7qnkc53l@meerkat.local/=0A=
=0AIn brief, the logic here is that the "Signed-off-by" trailer indicates=
 where the chain of custody for all previous trailers ends. The following=
 order:=0A=0AReviewed-by: Reviewer <>=0ASigned-off-by: Submitter <>=0ASig=
ned-off-by: Submaintainer <>=0A=0ATells that it was the Submitter who col=
lected and applied the Reviewed-by tag, which is why when someone runs "b=
4 trailers -u", their Signed-off-by is always moved to the bottom to indi=
cate the proper chain of custody boundary.=0A=0AThe following order says =
something very different:=0A=0ASigned-off-by: Submitter <>=0AReviewed-by:=
 Reviewer <>=0ASigned-off-by: Submaintainer <>=0A=0AThis indicates that t=
he "Reviewed-by" trailer was collected by the Submaintainer, because it i=
s below the chain-of-custody boundary of the Submitter.=0A=0AThe main rea=
son is if Reviewer says "hey, I don't remember reviewing this, who put my=
 name in there," the order will point at the person in whose custody sect=
ion this tag shows up.=0A=0AHope this helps.=0A=0ABest regards,=0A-K
