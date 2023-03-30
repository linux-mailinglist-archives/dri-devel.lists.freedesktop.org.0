Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B076D125C
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 00:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3BA710F08B;
	Thu, 30 Mar 2023 22:43:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com
 [216.40.44.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B938B10F08D
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 22:43:17 +0000 (UTC)
Received: from omf04.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay08.hostedemail.com (Postfix) with ESMTP id 41579140304;
 Thu, 30 Mar 2023 22:43:15 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf04.hostedemail.com (Postfix) with ESMTPA id 8664F20028; 
 Thu, 30 Mar 2023 22:43:09 +0000 (UTC)
Message-ID: <da9d8c2174e0813be2e0e6b31129e90fddaa128e.camel@perches.com>
Subject: Re: [PATCH v3 3/4] checkpatch: allow Closes tags with links
From: Joe Perches <joe@perches.com>
To: Matthieu Baerts <matthieu.baerts@tessares.net>, Jonathan Corbet
 <corbet@lwn.net>, Andy Whitcroft <apw@canonical.com>, Dwaipayan Ray
 <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Kai
 =?ISO-8859-1?Q?Wasserb=E4ch?= <kai@dev.carbon-project.org>, Thorsten
 Leemhuis <linux@leemhuis.info>,  Andrew Morton <akpm@linux-foundation.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Bagas Sanjaya
 <bagasdotme@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 30 Mar 2023 15:43:08 -0700
In-Reply-To: <20230314-doc-checkpatch-closes-tag-v3-3-d1bdcf31c71c@tessares.net>
References: <20230314-doc-checkpatch-closes-tag-v3-0-d1bdcf31c71c@tessares.net>
 <20230314-doc-checkpatch-closes-tag-v3-3-d1bdcf31c71c@tessares.net>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 8664F20028
X-Stat-Signature: o7s8y4yexe96pcmeht83bc8k1kmp4ytc
X-Spam-Status: No, score=1.40
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1839bgV7wydgfXH7bCqxQ9k9vhrNnfor3U=
X-HE-Tag: 1680216189-513749
X-HE-Meta: U2FsdGVkX1+lgCVmV5KU3BNZtM6xwIk2/vlX9i6ZiIMH3ZU0YFPXMf/3WNcfaIuPazErrbphMTyQUkRCP/L9PA==
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

On Thu, 2023-03-30 at 20:13 +0200, Matthieu Baerts wrote:
> As a follow-up of a previous patch modifying the documentation to
> allow using the "Closes:" tag, checkpatch.pl is updated accordingly.
>=20
> checkpatch.pl now no longer complain when the "Closes:" tag is used by
> itself or after the "Reported-by:" tag.
>=20
> Fixes: 76f381bb77a0 ("checkpatch: warn when unknown tags are used for lin=
ks")
> Fixes: d7f1d71e5ef6 ("checkpatch: warn when Reported-by: is not followed =
by Link:")

I don't think this _fixes_ anything.
I believe it's merely a new capability.

> Closes: https://github.com/multipath-tcp/mptcp_net-next/issues/373
> Signed-off-by: Matthieu Baerts <matthieu.baerts@tessares.net>
> ---
> v3:
>  - split into 2 patches: the previous one adds a list with all the
>    "link" tags. This one only allows the "Closes" tag. (Joe Perches)
>  - "Closes" is no longer printed between parenthesis. (Thorsten
>    Leemhuis)
> ---
>  scripts/checkpatch.pl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 9d092ff4fc16..ca58c734ff22 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -620,7 +620,7 @@ our $signature_tags =3D qr{(?xi:
>  	Cc:
>  )};
> =20
> -our @link_tags =3D qw(Link);
> +our @link_tags =3D qw(Link Closes);
> =20
>  #Create a search and print patterns for all these strings to be used dir=
ectly below
>  our $link_tags_search =3D "";
>=20

