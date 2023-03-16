Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D247F6BCBBD
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 10:59:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F4668911F;
	Thu, 16 Mar 2023 09:59:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2193 seconds by postgrey-1.36 at gabe;
 Thu, 16 Mar 2023 09:58:58 UTC
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E0668911F
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 09:58:58 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1pcjoR-00025p-AV; Thu, 16 Mar 2023 10:22:19 +0100
Message-ID: <c27709bd-90af-ec4f-de0b-3a4536bc17ca@leemhuis.info>
Date: Thu, 16 Mar 2023 10:22:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US, de-DE
To: Matthieu Baerts <matthieu.baerts@tessares.net>,
 Jonathan Corbet <corbet@lwn.net>, Andy Whitcroft <apw@canonical.com>,
 Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 =?UTF-8?Q?Kai_Wasserb=c3=a4ch?= <kai@dev.carbon-project.org>,
 Andrew Morton <akpm@linux-foundation.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
References: <20230314-doc-checkpatch-closes-tag-v1-0-1b83072e9a9a@tessares.net>
From: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [PATCH 0/2] docs & checkpatch: allow Closes tags with links
In-Reply-To: <20230314-doc-checkpatch-closes-tag-v1-0-1b83072e9a9a@tessares.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1678960738;317fd50a;
X-HE-SMSGID: 1pcjoR-00025p-AV
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

On 15.03.23 18:44, Matthieu Baerts wrote:
> Since v6.3, checkpatch.pl now complains about the use of "Closes:" tags
> followed by a link [1]. It also complains if a "Reported-by:" tag is
> followed by a "Closes:" one [2].
> 
> As detailed in the first patch, this "Closes:" tag is used for a bit of
> time, mainly by DRM and MPTCP subsystems. It is used by some bug
> trackers to automate the closure of issues when a patch is accepted.
> 
> Because this tag is used for a bit of time by different subsystems and
> it looks like it makes sense and it is useful for them, I didn't bother
> Linus to get his permission to continue using it. If you think this is
> necessary to do that up front, please tell me and I will be happy to ask
> for his agreement.

Due to how he reacted to some "invented" tags recently, I'd think it
would be appropriate to CC him on this patchset, as he then can speak up
if he wants to (and I assume a few more mails don't bother him).

> The first patch updates the documentation to explain what is this
> "Closes:" tag and how/when to use it. The second patch modifies
> checkpatch.pl to stop complaining about it.

I liked Andrew's `have been using "Addresses:" on occasion. [...] more
humble [...]` comment.  Sadly that tag is not supported by GitLab and
GitHub. But well, "Resolves" is and also a bit more humble if you ask
me. How about using that instead? Assuming that Konstantin can work with
that tag, too, but I guess he can.

I also wonder if the texts for the documentation could be shorter.
Wouldn't something like this do?

`Instead of "Link:" feel free to use "Resolves:" with an URL instead, if
the issue was filed in a public bug tracker that will consider the issue
resolved when it noticed that tag.`

[s/Resolves/Closes/ if we stick to that]

Side note: makes we wonder if we should go "all in" here to avoid
confusion and allow "Resolves" everywhere, even for links to lore.

> [...]

Ciao, Thorsten
