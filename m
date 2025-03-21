Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17876A6B348
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 04:24:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1122710E6DF;
	Fri, 21 Mar 2025 03:24:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 535 seconds by postgrey-1.36 at gabe;
 Fri, 21 Mar 2025 03:24:11 UTC
Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com
 [216.40.44.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5169510E310;
 Fri, 21 Mar 2025 03:24:10 +0000 (UTC)
Received: from omf15.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay08.hostedemail.com (Postfix) with ESMTP id B4A64141BC9;
 Fri, 21 Mar 2025 03:15:02 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf15.hostedemail.com (Postfix) with ESMTPA id 5C4CA1B; 
 Fri, 21 Mar 2025 03:14:57 +0000 (UTC)
Message-ID: <cf0501d3245554150b4a19ced0401228fc58b335.camel@perches.com>
Subject: Re: [PATCH v2 34/59] checkpatch: dont warn about unused macro arg
 on empty body
From: Joe Perches <joe@perches.com>
To: Jim Cromie <jim.cromie@gmail.com>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-gfx-trybot@lists.freedesktop.org, Andrew Morton
 <akpm@linux-foundation.org>
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org, 
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch, 
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com, 
 ville.syrjala@linux.intel.com, Andy Whitcroft <apw@canonical.com>,
 Dwaipayan Ray	 <dwaipayanray1@gmail.com>, Lukas Bulwahn
 <lukas.bulwahn@gmail.com>
Date: Thu, 20 Mar 2025 20:14:54 -0700
In-Reply-To: <20250320185238.447458-35-jim.cromie@gmail.com>
References: <20250320185238.447458-1-jim.cromie@gmail.com>
 <20250320185238.447458-35-jim.cromie@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-Stat-Signature: iyw3o7jfnibfiwm8pf6ibncbdu7sr4cj
X-Rspamd-Server: rspamout04
X-Spam-Status: No, score=1.40
X-Rspamd-Queue-Id: 5C4CA1B
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/d9AFXY+OSiUh0DxEBRYtGbqh22M41r8M=
X-HE-Tag: 1742526897-40709
X-HE-Meta: U2FsdGVkX19v9u9NW6oOmjvrpY1bOxIWEW9ri8JTiu4krXIx0x4kkL3s61ycTUBVYqWZAIJ7C/Ffq/K4gn5g+x1GbdOrO8rxiB8vtXETDudv0bhAPVRTw1fTVd5XJOHb/T08AWWA/4+GAzz9gnI5j6EyCey42Mqds9Lh08qsIzFVVyEcE7VHsKRjN8+S78BB3IBAQZFf7JMHDzXKhyH+lKLH5xdY8wExVk1cTEYPnOiKtwrJVMU1Eqkzz5h/loNI06mGRiIU85CSc6y1/HEX6ycoLpVjDOfobMLd1AORzTdbRT7BLQ4pU6iK/RH+RU7sISAfSyV7gS1CHTH3IGEouccv2lGAGUKbzNYhnppxyhHx9lx4ATXEqmEqFJ7l5CDT4NwyArNrcE9vTgCIoAmzJvnzTrB72hFZaDZ5l3THts2SLb00BePyImuDplXttMbBt7RPNwhWyuDOnZqrhSwXMA==
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

On Thu, 2025-03-20 at 12:52 -0600, Jim Cromie wrote:
> we currently get:
>   WARNING: Argument 'name' is not used in function-like macro
> on:
>   #define DRM_CLASSMAP_USE(name)  /* nothing here */
>=20
> Following this advice is wrong here, and shouldn't be fixed by
> ignoring args altogether; the macro should properly fail if invoked
> with 0 or 2+ args.
>=20
> cc: Andy Whitcroft <apw@canonical.com>
> cc: Joe Perches <joe@perches.com>
> cc: Dwaipayan Ray <dwaipayanray1@gmail.com>
> cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>

Completely sensible, thanks Jim.

> ---
>  scripts/checkpatch.pl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 7b28ad331742..0c4f578ea6e7 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -6037,7 +6037,7 @@ sub process {
>  				}
> =20
>  # check if this is an unused argument
> -				if ($define_stmt !~ /\b$arg\b/) {
> +				if ($define_stmt !~ /\b$arg\b/ && $define_stmt) {
>  					WARN("MACRO_ARG_UNUSED",
>  					     "Argument '$arg' is not used in function-like macro\n" . "$her=
ectx");
>  				}

