Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7EA6C85A9
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 20:13:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D1DF10E1AB;
	Fri, 24 Mar 2023 19:13:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com
 [216.40.44.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D50AF10E1AB
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 19:13:28 +0000 (UTC)
Received: from omf08.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay04.hostedemail.com (Postfix) with ESMTP id 572AA1A0A8F;
 Fri, 24 Mar 2023 19:13:26 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf08.hostedemail.com (Postfix) with ESMTPA id B70072002A; 
 Fri, 24 Mar 2023 19:13:21 +0000 (UTC)
Message-ID: <d24f2eca8f2a858b48ad0e019e58e0e5098be5c3.camel@perches.com>
Subject: Re: [PATCH v2 2/2] checkpatch: allow Closes tags with links
From: Joe Perches <joe@perches.com>
To: Matthieu Baerts <matthieu.baerts@tessares.net>, Jonathan Corbet
 <corbet@lwn.net>, Andy Whitcroft <apw@canonical.com>, Dwaipayan Ray
 <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Kai
 =?ISO-8859-1?Q?Wasserb=E4ch?= <kai@dev.carbon-project.org>, Thorsten
 Leemhuis <linux@leemhuis.info>,  Andrew Morton <akpm@linux-foundation.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Bagas Sanjaya
 <bagasdotme@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 24 Mar 2023 12:13:20 -0700
In-Reply-To: <20230314-doc-checkpatch-closes-tag-v2-2-f4a417861f6d@tessares.net>
References: <20230314-doc-checkpatch-closes-tag-v2-0-f4a417861f6d@tessares.net>
 <20230314-doc-checkpatch-closes-tag-v2-2-f4a417861f6d@tessares.net>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-Stat-Signature: ueoppisyctp79ob1ykz11ezkamktrpmg
X-Rspamd-Server: rspamout06
X-Spam-Status: No, score=-3.60
X-Rspamd-Queue-Id: B70072002A
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/rnsL3jh5b7vFnhiq2EJ20FSC9CMS8VTU=
X-HE-Tag: 1679685201-138756
X-HE-Meta: U2FsdGVkX18Y6PQUWshUibiJaAB9uJGTc2IJEjKdh4MImApySznRV2uLAUg0dKV2BKT0GKvCRKciITt6cxVeVw==
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
Cc: mptcp@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2023-03-24 at 19:52 +0100, Matthieu Baerts wrote:
> As a follow-up of the previous patch modifying the documentation to
> allow using the "Closes:" tag, checkpatch.pl is updated accordingly.
>=20
> checkpatch.pl now mentions the "Closes:" tag between brackets to express
> the fact it should be used only if it makes sense.
>=20
> While at it, checkpatch.pl will not complain if the "Closes" tag is used
> with a "long" line, similar to what is done with the "Link" tag.
>=20
> Fixes: 76f381bb77a0 ("checkpatch: warn when unknown tags are used for lin=
ks")
> Fixes: d7f1d71e5ef6 ("checkpatch: warn when Reported-by: is not followed =
by Link:")
> Closes: https://github.com/multipath-tcp/mptcp_net-next/issues/373
> Signed-off-by: Matthieu Baerts <matthieu.baerts@tessares.net>
> ---
>  scripts/checkpatch.pl | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index bd44d12965c9..d6376e0b68cc 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3158,14 +3158,14 @@ sub process {
>  				}
>  			}
> =20
> -# check if Reported-by: is followed by a Link:
> +# check if Reported-by: is followed by a Link: (or Closes:) tag
>  			if ($sign_off =3D~ /^reported(?:|-and-tested)-by:$/i) {
>  				if (!defined $lines[$linenr]) {
>  					WARN("BAD_REPORTED_BY_LINK",
> -					     "Reported-by: should be immediately followed by Link: to the r=
eport\n" . $herecurr . $rawlines[$linenr] . "\n");
> -				} elsif ($rawlines[$linenr] !~ m{^link:\s*https?://}i) {
> +					     "Reported-by: should be immediately followed by Link: (or Clos=
es:) to the report\n" . $herecurr . $rawlines[$linenr] . "\n");
> +				} elsif ($rawlines[$linenr] !~ m{^(link|closes):\s*https?://}i) {

Please do not use an unnecessary capture group.

		(?:link|closes)

And because it's somewhat likely that _more_ of these keywords
could be added, perhaps use some array like deprecated_apis


>  					WARN("BAD_REPORTED_BY_LINK",
> -					     "Reported-by: should be immediately followed by Link: with a U=
RL to the report\n" . $herecurr . $rawlines[$linenr] . "\n");
> +					     "Reported-by: should be immediately followed by Link: (or Clos=
es:) with a URL to the report\n" . $herecurr . $rawlines[$linenr] . "\n");
>  				}
>  			}
>  		}
> @@ -3250,8 +3250,8 @@ sub process {
>  					# file delta changes
>  		      $line =3D~ /^\s*(?:[\w\.\-\+]*\/)++[\w\.\-\+]+:/ ||
>  					# filename then :
> -		      $line =3D~ /^\s*(?:Fixes:|Link:|$signature_tags)/i ||
> -					# A Fixes: or Link: line or signature tag line
> +		      $line =3D~ /^\s*(?:Fixes:|Link:|Closes:|$signature_tags)/i ||
> +					# A Fixes:, Link:, Closes: or signature tag line
>  		      $commit_log_possible_stack_dump)) {
>  			WARN("COMMIT_LOG_LONG_LINE",
>  			     "Possible unwrapped commit description (prefer a maximum 75 char=
s per line)\n" . $herecurr);
> @@ -3266,13 +3266,13 @@ sub process {
> =20
>  # Check for odd tags before a URI/URL
>  		if ($in_commit_log &&
> -		    $line =3D~ /^\s*(\w+):\s*http/ && $1 ne 'Link') {
> +		    $line =3D~ /^\s*(\w+):\s*http/ && $1 ne 'Link' && $1 ne 'Closes') =
{
>  			if ($1 =3D~ /^v(?:ersion)?\d+/i) {
>  				WARN("COMMIT_LOG_VERSIONING",
>  				     "Patch version information should be after the --- line\n" . $h=
erecurr);
>  			} else {
>  				WARN("COMMIT_LOG_USE_LINK",
> -				     "Unknown link reference '$1:', use 'Link:' instead\n" . $herecu=
rr);
> +				     "Unknown link reference '$1:', use 'Link:' (or 'Closes:') inste=
ad\n" . $herecurr);
>  			}
>  		}
> =20
>=20

