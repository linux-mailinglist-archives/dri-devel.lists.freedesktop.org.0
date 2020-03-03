Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5152178BD6
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 08:48:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C8B6EAED;
	Wed,  4 Mar 2020 07:47:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD436EA8A
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 15:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1583248809;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=rKMD7BQOvvf2EnNvM4tQSBZbaPpVD8OTqQcL6Q0plyw=;
 b=PhxESi+lGZCUo53QbMNa4SrjK1bTU1FykuVIrBWS67ko1bZOd8etpmvwjTS2uE98Ea
 oGtcvEHCzdNNpQ/n7ZSJ6zSqdyRl1PiTgFoifaEJn59VpKlMoIJ6fz8xz8SCr7FiteSE
 qJT4JfExXeHuvXscGOUMmOH/6l5NjpPsXuBUM+NPbeyWqpiaMtsxM690fvZTSwEhLOjO
 /PGs9d2Wp5wwBjA0NbIEukK7Fdgmx2ZTuY/12rr/kJihddQZSJW1ye+kisq3WWwBdTcE
 I34E/pm4Sw2I+d0ldobDK60/m1o8z31f69NXtCh5y6aGu1LGwrEZfd3UToyTIEP/SQuR
 UqqA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGHPrpwDGvxw=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 46.2.0 DYNA|AUTH)
 with ESMTPSA id y0a02cw23FJxJxq
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Tue, 3 Mar 2020 16:19:59 +0100 (CET)
Subject: Re: [RFC 0/8] MIPS: CI20: add HDMI out support
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200303145848.GA13796@bogus>
Date: Tue, 3 Mar 2020 16:19:59 +0100
Message-Id: <6A9DD709-DF42-4A68-9EA4-A2F9C7A49DBA@goldelico.com>
References: <cover.1582744379.git.hns@goldelico.com>
 <20200227122325.GA7587@ravnborg.org>
 <8EE60F87-415A-44EA-AA49-632E232095FF@goldelico.com>
 <20200303145848.GA13796@bogus>
To: Rob Herring <robh@kernel.org>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Wed, 04 Mar 2020 07:47:28 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Paul Boddie <paul@boddie.org.uk>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Paul Burton <paulburton@kernel.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Andi Kleen <ak@linux.intel.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Sam Ravnborg <sam@ravnborg.org>, "Eric W. Biederman" <ebiederm@xmission.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

> Am 03.03.2020 um 15:58 schrieb Rob Herring <robh@kernel.org>:
> 
> On Thu, Feb 27, 2020 at 01:56:56PM +0100, H. Nikolaus Schaller wrote:
>> Hi Sam,
>> 
>> 
>> Or that there will appear good tools soon. E.g. some GUI
>> based editor tool would be very helpful so that you don't have
>> to fight with the yaml indentation rules. Like there are XML
>> and DTD editors. And even HTML is rarely written manually any more.
>> 
>> IMHO such tools should have been developed and in place *before*
>> the rule to provide DT schemata is enforced.
> 
> You mean tools like what is discussed here:
> 
> https://www.redhat.com/sysadmin/yaml-tips
> 
> There's also yaml-format in the dtschema repo which will reformat a file 
> to the desired formatting. It is just a wrapper around ruamel yaml 
> library.

What I dream of is a higher level higher abstraction than a YAML
editor because the problems I face are not only YAML syntax but that
I don't know what should be where in a scheme file and why.

So I'd like to have a Schema editor. I.e. some editor where I
can edit a list of properties and can e.g. checkmark "required".
And simply type a description into some text field.

And the editor knows where to place the keywords -item -enum
-oneOf -description etc. when doing a Save operation.

Basically what I dream of is more like MarkDown where you write text,
titles paragraphs etc. and that gets magically translated into 
valid HTML. Or even better analogy: OpenOffice where you just
write and format your text and one does not have to edit PostScript
printer commands.

But it is likely to stay a dream.

BR and thanks,
Nikolaus

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
