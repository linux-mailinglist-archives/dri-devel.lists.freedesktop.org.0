Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 331AA1B50FB
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 01:45:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5DED89FD4;
	Wed, 22 Apr 2020 23:45:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0251.hostedemail.com
 [216.40.44.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C385789FD4
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 23:45:24 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay08.hostedemail.com (Postfix) with ESMTP id 4BDCF182CED2A;
 Wed, 22 Apr 2020 23:45:22 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:305:355:379:599:800:960:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1535:1543:1593:1594:1605:1711:1730:1747:1777:1792:2393:2553:2559:2562:2827:2828:2911:3138:3139:3140:3141:3142:3622:3653:3865:3866:3867:3868:3870:3871:3872:3873:3874:4250:4321:4425:5007:6119:6299:6691:7875:7901:7903:7974:8531:8660:10004:10400:10848:11026:11232:11658:11914:12043:12295:12296:12297:12346:12555:12740:12895:13019:13138:13148:13230:13231:13439:13894:14180:14181:14659:14721:21060:21080:21324:21325:21433:21611:21627:21740:21819:21939:21990:30022:30029:30054:30069:30070:30075:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:17, LUA_SUMMARY:none
X-HE-Tag: slope31_118e74ec0bf03
X-Filterd-Recvd-Size: 5035
Received: from XPS-9350.home (unknown [47.151.136.130])
 (Authenticated sender: joe@perches.com)
 by omf06.hostedemail.com (Postfix) with ESMTPA;
 Wed, 22 Apr 2020 23:45:20 +0000 (UTC)
Message-ID: <9a32f150f85f851d04afd148b2a9a5cf203f7ce1.camel@perches.com>
Subject: Re: Rule for bridge yaml dt binding maintainers?
From: Joe Perches <joe@perches.com>
To: Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Date: Wed, 22 Apr 2020 16:43:03 -0700
In-Reply-To: <CAL_JsqJXa8QxQmLfkCO8_SSsgYm2nTFW1J6wx4bGbZgAy8Sxog@mail.gmail.com>
References: <87d082jtfn.fsf@collabora.com> <20200420175909.GA5810@ravnborg.org>
 <CAL_JsqJXa8QxQmLfkCO8_SSsgYm2nTFW1J6wx4bGbZgAy8Sxog@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Adrian Ratiu <adrian.ratiu@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Collabora Kernel ML <kernel@collabora.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2020-04-22 at 15:02 -0500, Rob Herring wrote:
> On Mon, Apr 20, 2020 at 12:59 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> > Hi Adrian
> > =

> > On Mon, Apr 20, 2020 at 02:19:24PM +0300, Adrian Ratiu wrote:
> > > Hello,
> > > =

> > > I got confused while doing the txt -> yaml conversion at [1] and it's=
 still
> > > not clear to me who should be added in the "maintainers" field.  Clea=
rly not
> > > the maintainers as returned by get_maintainer.pl. :)
> > > =

> > > Rob mentioned that "owners" should be manintainers but I also have tr=
ouble
> > > picking the persons who should be owners / yaml maintainers.
> > > =

> > > Looking at the completed bridge conversions in the latest linux-next,=
 I
> > > couldn't find a rule and the majority of bindings are still txt:
> > > =

> > > $ find ./devicetree/bindings/display/bridge/ -name *txt | wc -l
> > > 23
> > > $ find ./devicetree/bindings/display/bridge/ -name *yaml | wc -l
> > > 5
> > > =

> > > So my questions are:
> > > 1. Is there a general rule for assigning yaml file owners/maintainers?
> > > =

> > > 2. Is this vagueness specific to the bridge dt bindings only?
> > > =

> > > 3. Who should step up and maintain these bindings? Original/new autho=
rs,
> > > SoC, bridge, DRM maintainers etc.?
> > > =

> > > It would be useful to have a rule to make it easier to do these conve=
rsions.
> > > We (Collabora) are considering doing the conversion work.
> > =

> > For the panel conversion I did recently it was simple:
> > 1) If listed in MAINTAINERS - use this info
> > 2) Otherwise use the person(s) that authored the original .txt file.
> >    Using git log --follow foo.txt
> > 3) In a few cases I may have decided otherwise, but the above covers the
> >    majority.
> =

> Yes.
> =

> > I would also be great if you or someone else could:
> > - teach get_maintainers about .yaml file listed maintainers
> =

> It already does to some extent. IIRC, there's a mode to extract email
> addresses from files.

--file-emails

> I was hoping that the MAINTAINERS file split happens sometime and we
> can just generate a MAINTAINERS file for bindings.

I don't see the value really.

> > - teach checkpatch that it is OK to convert .txt to .yaml

I suppose that get_maintainer _could_ enable --file-emails
for .yaml files.

something like this (more comments below too)
---
 scripts/get_maintainer.pl | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
index 6cbcd1..9d947a0 100755
--- a/scripts/get_maintainer.pl
+++ b/scripts/get_maintainer.pl
@@ -527,7 +527,7 @@ foreach my $file (@ARGV) {
 	$file =3D~ s/^\Q${cur_path}\E//;	#strip any absolute path
 	$file =3D~ s/^\Q${lk_path}\E//;	#or the path to the lk tree
 	push(@files, $file);
-	if ($file ne "MAINTAINERS" && -f $file && ($keywords || $file_emails)) {
+	if ($file ne "MAINTAINERS" && -f $file && ($keywords || $file_emails || $=
file =3D~ /\.yaml$/)) {
 	    open(my $f, '<', $file)
 		or die "$P: Can't open $file: $!\n";
 	    my $text =3D do { local($/) ; <$f> };
@@ -539,7 +539,7 @@ foreach my $file (@ARGV) {
 		    }
 		}
 	    }
-	    if ($file_emails) {
+	    if ($file_emails || $file =3D~ /\.yaml$/) {
 		my @poss_addr =3D $text =3D~ m$[A-Za-z=C0-=FF\"\' \,\.\+-]*\s*[\,]*\s*[\=
(\<\{]{0,1}[A-Za-z0-9_\.\+-]+\@[A-Za-z0-9\.-]+\.[A-Za-z0-9]+[\)\>\}]{0,1}$g;
 		push(@file_emails, clean_file_emails(@poss_addr));
 	    }

---

> Yeah, I should fix my bug.
> =

> > - teach checkpatch about some simple yaml validation (maybe)
> =

> I don't see checkpatch being able to check much of what comes up in
> review. Maybe indentation.

Likely better done with another external tool.

Could be added to checkpatch as an external
call like spdxcheck.py



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
